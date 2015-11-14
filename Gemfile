source 'https://rubygems.org'

ruby '2.2.3'

gem 'sinatra'

source 'https://rails-assets.org' do
  gem 'rails-assets-font-awesome'
  gem 'rails-assets-bootstrap', '~> 3.3.5'
end

group :development, :test do
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'spring'
  gem 'web-console', '~> 2.0'
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'guard', '>= 2.2.2', require: false
  gem 'guard-minitest', require: false
  gem 'rb-fsevent', require: false
  gem 'annotate', '~> 2.6.5'
  gem 'better_errors'
  gem 'eslint-rails'
  gem 'foreman'
  gem 'guard-rubocop', require: false
  gem 'quiet_assets'
end

group :production do
  gem 'passenger'
  gem 'rails_12factor'
end
