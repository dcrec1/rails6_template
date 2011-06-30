source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

gem 'sqlite3'

gem "haml-rails"
gem "inherited_resources"
gem "devise"
gem "formtastic"
gem "friendly_id"
gem "compass"
gem "hoptoad_notifier"
gem "inploy"
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

group :development do
  gem "autotest"
  gem "autotest-notification"
  gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
  gem "metric_fu", ">=1.5.1"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "rspec-rails", ">=2.0.1"
  gem 'evergreen', :require => 'evergreen/rails'
  platforms :mri_18 do
    gem "ruby-debug"
  end
  platforms :mri_19 do
    gem "ruby-debug19", :require => 'ruby-debug'
  end
end

group :test do
  gem "rspec", ">=2.0.1"
  gem "remarkable", ">=4.0.0.alpha4"
  gem "remarkable_activemodel", ">=4.0.0.alpha4"
  gem "remarkable_activerecord", ">=4.0.0.alpha4"
  gem 'turn', :require => false
end

group :cucumber do
  gem "cucumber", ">=0.6.3"
  gem "cucumber-rails", ">=0.3.2"
  gem "capybara", ">=0.3.6"
  gem "database_cleaner", ">=0.5.0"
  gem "spork", ">=0.8.4"
  gem "pickle", ">=0.4.2"
end

group :production do
  gem "newrelic_rpm", ">=2.12.3"
end
