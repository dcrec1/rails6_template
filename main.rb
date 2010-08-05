run "rm -Rf README public/index.html public/javascripts/* test app/views/layouts/*"

gem 'haml', '>=3.0.14'
gem 'inherited_resources', '>=1.1.2'
gem 'will_paginate', '>=3.0.pre'
gem 'devise', '>=1.1.rc2'
gem "formtastic", :git => "git://github.com/justinfrench/formtastic.git", :branch => "rails3"
gem 'friendly_id', '~>3.0'
gem "compass", ">= 0.10.1"

gem 'rspec', '>=2.0.0.alpha.11', :group => :test
gem 'rspec-rails', '>=2.0.0.alpha.11', :group => :test
gem 'remarkable', '>=4.0.0.alpha4', :group => :test
gem 'remarkable_activemodel', '>=4.0.0.alpha4', :group => :test
gem 'remarkable_activerecord', '>=4.0.0.alpha4', :group => :test
gem "factory_girl_rails" # BUG => , :group => :test

gem 'cucumber', ">=0.6.3", :group => :cucumber
gem 'cucumber-rails', ">=0.3.2", :group => :cucumber
gem 'capybara', ">=0.3.6", :group => :cucumber
gem 'database_cleaner', ">=0.5.0", :group => :cucumber
gem 'spork', ">=0.8.4", :group => :cucumber
gem "pickle", :git => "git://github.com/codegram/pickle.git", :group => :cucumber

gem "newrelic_rpm", ">=2.12.3", :group => :production

gem 'inploy'

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git"

application  <<-GENERATORS 
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

run "bundle install"
generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle:skeleton --path --email"
generate "friendly_id"
generate "formtastic:install"
run "gem install compass"
run "compass init --using blueprint --app rails --css-dir public/stylesheets"

run "rm public/stylesheets/*"

get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/dcrec1/rails3_template/raw/master/gitignore" ,".gitignore" 
get "http://github.com/dcrec1/rails3_template/raw/master/screen.scss", "app/stylesheets/screen.scss"
get "http://github.com/dcrec1/rails3_template/raw/master/application.html.haml", "app/views/layouts/application.html.haml"
get "http://github.com/dcrec1/rails3_template/raw/master/factory_girl.rb", "features/support/factory_girl.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/remarkable.rb", "spec/support/remarkable.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/build.rake", "lib/tasks/build.rake"
get "http://github.com/dcrec1/rails3_template/raw/master/build.sh", "build.sh"
get "http://github.com/dcrec1/rails3_template/raw/master/overlay.png", "public/images/overlay.png"
get "http://github.com/dcrec1/rails3_template/raw/master/newrelic.yml", "config/newrelic.yml"

create_file 'config/deploy.rb', <<-DEPLOY
application = '#{app_name}'
repository = ''
hosts = %w() 
DEPLOY

git :init
git :add => '.'
git :commit => '-am "Initial commit"'
 
puts "SUCCESS!"
