source 'https://rubygems.org'

gem 'rails', '3.2.10'
gem 'unicorn'
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
gem 'inploy'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-jasmine'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'rb-fsevent', '~> 0.9.1'
  gem "mailcatcher"
  gem "faker"
end

group :development, :test do
  gem "rspec-rails"
  gem 'sqlite3'
  gem "pry-rails"
  gem "jasminerice"
end

group :test do
  gem 'turn', :require => false
  gem "rspec"
  gem "capybara"
  gem 'capybara-screenshot'
  gem "poltergeist"
  gem "xpath"
  gem "launchy"
  gem "factory_girl_rails"
end

group :production do
  gem 'mysql2'
  gem "newrelic_rpm"
end
