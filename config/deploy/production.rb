set :rails_env, "production"

set :branch, 'master'

server '10conseilspour.fr', :app, :web
role :db, '10conseilspour.fr', :primary => true