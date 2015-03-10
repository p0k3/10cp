set :rails_env, "production"

set :branch, 'master'

server '37.187.37.41', :app, :web
role :db, '37.187.37.41', :primary => true