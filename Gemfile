source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sequel'
gem 'sinatra-sequel'
gem 'rake'
gem 'unicorn'
gem 'pg'     # make sure you have installed 'libpq-dev'
gem 'bacon'

group :test do
  gem 'rspec'
  gem 'rack-test'
end

group :development do
  gem 'sqlite3'
  gem 'shotgun'
  gem 'tux'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'terminal-notifier-guard'
  gem 'web-console'
end

group :production do
	gem 'rails_12factor'
  #gem 'byebug'
end

group :test, :development do
  gem 'fuubar'
end
