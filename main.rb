run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"

gem "haml-rails", ">= 0.2"
gem 'inherited_resources', '>=1.1.2'
gem 'will_paginate', '>=3.0.pre2'
gem 'devise', '>=1.1.2'
gem "formtastic", '>=1.1.0'
gem 'friendly_id', '~>3.0'
gem "compass", ">= 0.10.5"

gem "metric_fu", ">=1.5.1", :group => :development

gem 'rspec', '>=2.0.1', :group => :test
gem 'rspec-rails', '>=2.0.1', :group => [:development, :test]
gem 'remarkable', '>=4.0.0.alpha4', :group => :test
gem 'remarkable_activemodel', '>=4.0.0.alpha4', :group => :test
gem 'remarkable_activerecord', '>=4.0.0.alpha4', :group => :test
gem "factory_girl_rails"

gem 'cucumber', ">=0.6.3", :group => :cucumber
gem 'cucumber-rails', ">=0.3.2", :group => :cucumber
gem 'capybara', ">=0.3.6", :group => :cucumber
gem 'database_cleaner', ">=0.5.0", :group => :cucumber
gem 'spork', ">=0.8.4", :group => :cucumber
gem "pickle", ">=0.4.2", :group => :cucumber

gem "newrelic_rpm", ">=2.12.3", :group => :production
gem "hoptoad_notifier", '>=2.3.6'

gem 'inploy', '>=1.6.8'

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git"

run "bundle install"

plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git'

application  <<-GENERATORS 
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.integration_tool :rspec, :fixture => true, :views => true
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle --path --email"
generate "friendly_id"
generate "formtastic:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"
run "gem install compass"
run "compass init --using blueprint --app rails --css-dir public/stylesheets"

run "rm public/stylesheets/*"

run "wget --no-check-certificate 'https://github.com/rails/jquery-ujs/raw/master/src/rails.js' -O public/javascripts/rails.js"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/gitignore' -O .gitignore" 
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/screen.scss' -O app/stylesheets/screen.scss"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/print.scss' -O app/stylesheets/print.scss"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/application.html.haml' -O app/views/layouts/application.html.haml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/factory_girl.rb' -O features/support/factory_girl.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/devise_steps.rb' -O features/step_definitions/devise_steps.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/remarkable.rb' -O spec/support/remarkable.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/users.rb' -O spec/support/factories/users.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/build.rake' -O lib/tasks/build.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/build.sh' -O build.sh"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/overlay.png' -O public/images/overlay.png"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/newrelic.yml' -O config/newrelic.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/hoptoad.rb' -O config/initializers/hoptoad.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/htaccess' -O public/.htaccess"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/asset_packages.yml' -O config/asset_packages.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/grid.png' -O public/images/grid.png"

create_file 'config/deploy.rb', <<-DEPLOY
application = '#{app_name}'
repository = ''
hosts = %w() 
DEPLOY

append_file 'Rakefile', <<-METRIC_FU

MetricFu::Configuration.run do |config|  
  config.rcov[:rcov_opts] << "-Ispec"  
end rescue nil
METRIC_FU

run "chmod u+x build.sh"

git :init
git :add => '.'
git :commit => '-am "Initial commit"'
 
puts "SUCCESS!"
