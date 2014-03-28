source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'haml'
gem 'jquery-rails'
gem 'RedCloth'
gem 'devise'
gem 'simple_form'
gem "cancan"
gem 'net-ssh', '~> 2.8.1', :git => "https://github.com/net-ssh/net-ssh"
gem 'mysql2'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "capistrano", "2.15.5"
end

group :production, :staging do
  gem 'unicorn'
end


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end