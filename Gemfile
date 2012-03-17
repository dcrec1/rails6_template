source 'http://rubygems.org'

gem 'rails', '3.2.2'

gem "rails_admin", git: 'git://github.com/sferik/rails_admin.git'
gem "haml"
gem "inherited_resources"
gem "kaminari"
gem "devise"
gem "formtastic"
gem "friendly_id"
gem 'jquery-rails'
gem "airbrake"
gem "inploy"

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
end

group :development do
  gem "autotest"
  gem "autotest-notification"
  gem "mailcatcher"
  gem "faker"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "ruby-debug19"
  gem 'sqlite3'
end

group :test do  
  gem 'turn', :require => false
  gem "rspec"
end

group :cucumber do
  gem "cucumber-rails"
  gem "capybara"
  gem "database_cleaner"
  gem "spork"
  gem "pickle"
end

group :production do
  gem "mysql2"
  gem "newrelic_rpm"
  gem 'unicorn'
end
