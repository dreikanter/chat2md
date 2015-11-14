source 'https://rubygems.org'

ruby '2.2.3'

gem 'sinatra'
gem 'tilt'

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'guard', '>= 2.2.2', require: false
  gem 'guard-minitest', require: false
  gem 'rb-fsevent', require: false
  gem 'eslint-rails'
  gem 'foreman'
  gem 'guard-rubocop', require: false
  gem 'pry'
end

group :production do
  gem 'passenger'
  gem 'rails_12factor'
end
