source 'https://rubygems.org'

gem 'sinatra', '2.0.2'
gem 'sinatra-contrib', '2.0.2'
gem 'sequel', '4.34.0'
gem 'sinatra-sequel', '0.9.0'
gem 'rake', '11.1.2'
gem 'unicorn', '5.1.0'
gem 'pg', '0.18.4'     # make sure you have installed 'libpq-dev'
gem 'bacon', '1.2.0'

group :test do
  gem 'rspec', '3.4.0'
  gem 'rack-test', '0.6.3'
end

group :development do
  gem 'sqlite3', '1.3.11'
  gem 'shotgun', '0.9.1'
  gem 'tux', '0.3.0'
  gem 'guard', '2.14.0'
  gem 'guard-rspec', '4.7.0', require: false
  gem 'terminal-notifier-guard', '1.7.0'
  gem 'web-console', '3.1.1'
  gem 'byebug', '9.0.4'
end

group :production do
	gem 'rails_12factor', '0.0.3'
end

group :test, :development do
  gem 'fuubar', '2.0.0'
end
