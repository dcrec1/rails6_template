source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem "rails_admin", :git => 'git://github.com/sferik/rails_admin.git'
gem "haml"
gem "inherited_resources"
gem "has_scope"
gem "kaminari"
gem "devise"
gem "formtastic"
gem "friendly_id"
gem 'jquery-rails'
gem 'airbrake'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
end

group :development do
  gem 'rack-livereload'
  gem "mailcatcher"
  gem "faker"
end

group :development, :test do
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem "rspec-rails"
  gem 'sqlite3'
  gem "pry-rails"
end

group :test do
  gem 'turn', :require => false
  gem "rspec"
  gem "capybara"
  gem "launchy"
  gem "factory_girl_rails"
end

group :production do
  gem 'mysql'
  gem "newrelic_rpm"
end