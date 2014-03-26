require "rvm/capistrano"
require "bundler/capistrano"

# multi staging
set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage' # import: after defining stages

# allowing shell interactions
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

set :application, "10cp"
set :user, "dixconseilspour"

set(:deploy_to) { "/home/#{user}/#{application}_#{rails_env}" }
set(:releases_path)     { File.join(deploy_to, version_dir) }
set(:shared_path)       { File.join(deploy_to, shared_dir) }
set(:current_path)      { File.join(deploy_to, current_dir) }
set(:release_path)      { File.join(releases_path, release_name) }

set :deploy_via, :remote_cache
set :scm, :git
set :repository,  "git@github.com:p0k3/10cp.git"

# number of releases we want to keep
set :keep_releases, 5

set :use_sudo, false

# # unicorn informations
set(:unicorn_config) { "#{current_path}/config/unicorn.rb" }
set(:unicorn_pid) { "#{shared_path}/pids/unicorn.pid" }
set(:unicorn_bin) { "#{current_path}/bin/unicorn" }

# useful for rbenv
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
set :bundle_flags, "--deployment --quiet --binstubs"

set(:sidekiq_processes) { 2 }

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      cd #{current_path} && #{unicorn_bin} -c #{unicorn_config} -E #{rails_env} -D
    CMD
  end

  task :force_stop, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [ -e #{unicorn_pid} ]; then
        kill -9 $(cat #{unicorn_pid});
      fi
    CMD
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [ -e #{unicorn_pid} ]; then
        kill $(cat #{unicorn_pid});
      fi
    CMD
  end

  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [ -e #{unicorn_pid} ]; then
        kill -s QUIT $(cat #{unicorn_pid});
      fi
    CMD
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [ -e #{unicorn_pid} ]; then
        kill -s USR2 $(cat #{unicorn_pid});
      fi
    CMD
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      if [ -e #{unicorn_pid} ]; then
        kill -9 $(cat #{unicorn_pid});
        sleep 3;
        cd #{current_path} && #{unicorn_bin} -c #{unicorn_config} -E #{rails_env} -D;
      fi
    CMD
  end

  # namespace :assets do
  #   task :precompile, :roles => :web, :except => { :no_release => true } do
  #     from = source.next_revision(current_revision) rescue nil
  #     if from.nil? || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #     else
  #       logger.info "Skipping asset pre-compilation because there were no asset changes"
  #     end
  #   end
  # end

  namespace :paperclip do
    desc 'Build missing paperclip styles.'
    task :build_missing_paperclip_styles, roles: :app do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake paperclip:refresh class=Attachment"
    end
  end

end

desc "Create shared folders."
after 'deploy:setup', :roles => :app do
  # for unicorn
  run "mkdir -p #{shared_path}/tmp/sockets"
  run "mkdir -p #{shared_path}/tmp/cache"
  run "mkdir -p #{shared_path}/tmp/sessions"
  run "mkdir -p #{shared_path}/config"
  run "mkdir -p #{shared_path}/files"
end

desc "Link database.yml and unicorn.rb"
after 'deploy:assets:symlink', :roles => :app do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{shared_path}/config/unicorn.rb #{release_path}/config/unicorn.rb"
  run "ln -nfs /home/gemstatic/static #{release_path}/public" # serve static files
end

desc "Migrate Database"
before "deploy:assets:precompile", "deploy:migrate"

desc "Tag the release in GIT"
task :git_tags, :roles => :db do
  tag_name = "#{rails_env.to_s[0,1].upcase}_#{Time.now.strftime('%y%m%d%H%M%S')}"
  puts "Tagging : #{tag_name}"
  run("cd #{release_path} && git tag #{tag_name}")
  run("cd #{release_path} && git push --tags")
end
after "deploy:update_code", "git_tags"

namespace :sidekiq do
  desc "Start sidekiq"
  task :start, :roles => lambda { fetch(:sidekiq_role) }, :on_no_matching_servers => :continue do
    rails_env = fetch(:rails_env, "production")
    # for_each_process do |pid_file, idx|
    #   run "cd #{current_path} ; nohup #{fetch(:sidekiq_cmd)} -e #{rails_env} -C #{current_path}/config/sidekiq.yml -i #{idx} -P #{pid_file} >> #{current_path}/log/sidekiq.log 2>&1 &", :pty => false
    # end
    run "cd #{current_path} ; nohup #{fetch(:sidekiq_cmd)} -e #{rails_env} -C #{current_path}/config/sidekiq.yml -i 0 -P #{current_path}/tmp/pids/sidekiq.pid -c 1 -q default >> #{current_path}/log/sidekiq.default.log 2>&1 &", :pty => false
    run "cd #{current_path} ; nohup #{fetch(:sidekiq_cmd)} -e #{rails_env} -C #{current_path}/config/sidekiq.yml -i 1 -P #{current_path}/tmp/pids/sidekiq.pid-1 -c 1 -q geolocation >> #{current_path}/log/sidekiq.geolocation.log 2>&1 &", :pty => false
  end
end