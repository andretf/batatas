source 'https://rubygems.org'
ruby '2.1.6'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sequel'
gem 'sinatra-sequel'
gem 'pg'
gem 'rake'
gem 'unicorn'

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
  gem 'byebug'
end

group :test, :development do
  gem 'fuubar'
end
