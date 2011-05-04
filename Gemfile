source 'http://rubygems.org'

gem 'rails', '3.0.6'

gem 'sqlite3-ruby', :require => 'sqlite3'

gem "rails_admin", :git => 'git://github.com/sferik/rails_admin.git'
gem "haml-rails", ">= 0.2"
gem "inherited_resources", ">=1.1.2"
gem "will_paginate", ">=3.0.pre2"
gem "devise", ">=1.1.2"
gem "formtastic", ">=1.1.0"
gem "friendly_id", "~>3.0"
gem "compass", ">= 0.10.6"
gem "lemonade", "0.3.4"
gem "barista", ">= 0.5.0"
gem "hoptoad_notifier", ">=2.3.6"
gem "inploy", ">=1.6.8"
gem "json"

group :development do
  gem "autotest"
  gem "autotest-notification"
  gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
  gem "metric_fu", ">=1.5.1"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "rspec-rails", ">=2.0.1"
  gem "evergreen", :require => "evergreen/rails"
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
  gem "capybara-envjs"
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
