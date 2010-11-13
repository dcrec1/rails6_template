file_string = "#{ENV["HOME"]}/.rails3_template.yml" 
if File.exists?(file_string)
  require 'yaml'
  config = YAML.load_file(file_string)
else
  config = {}
end

run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"

gem "haml-rails", ">= 0.2" unless config[:no_haml]
gem 'inherited_resources', '>=1.1.2' unless config[:no_inherited_resource]
gem 'will_paginate', '>=3.0.pre2' unless config[:no_paginate]
gem 'devise', '>=1.1.2' unless config[:no_devise]
gem "formtastic", '>=1.1.0' unless config[:no_formtastic]
gem 'friendly_id', '~>3.0' unless config[:no_friendly_id]
gem "compass", ">= 0.10.5" unless config[:no_compass]

gem "metric_fu", ">=1.5.1", :group => :development

unless config[:no_rspec]
  gem 'rspec', '>=2.0.0.rc', :group => :test
  gem 'rspec-rails', '>=2.0.0.rc', :group => [:development, :test]
  gem 'remarkable', '>=4.0.0.alpha4', :group => :test
  gem 'remarkable_activemodel', '>=4.0.0.alpha4', :group => :test
  gem 'remarkable_activerecord', '>=4.0.0.alpha4', :group => :test
  gem "factory_girl_rails"
end

unless config[:no_cucumber]
  gem 'cucumber', ">=0.6.3", :group => :cucumber
  gem 'cucumber-rails', ">=0.3.2", :group => :cucumber
  gem 'capybara', ">=0.3.6", :group => :cucumber
  gem 'database_cleaner', ">=0.5.0", :group => :cucumber
  gem 'spork', ">=0.8.4", :group => :cucumber
  gem "pickle", ">=0.4.2", :group => :cucumber
end

gem "newrelic_rpm", ">=2.12.3", :group => :production unless config[:no_rpm]
gem "hoptoad_notifier", '>=2.3.6' unless config[:no_hoptoad]
gem "exceptional", '>=2.0.0' unless config[:no_exceptional]

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git" unless config[:no_generators]

run "bundle install"

plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git' unless config[:no_asset_packager]

application  <<-GENERATORS 
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.integration_tool :rspec, :fixture => true, :views => true
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

generate "rspec:install" unless config[:no_rspec]
generate "cucumber:install --capybara --rspec --spork" unless config[:no_cucumber]
generate "pickle --path --email" unless config[:no_cucumber]
generate "friendly_id" unless config[:no_friendly_id]
generate "formtastic:install" unless config[:no_formtastic]
generate "devise:install" unless config[:no_devise]
generate "devise User" unless config[:no_devise]
generate "devise Admin" unless config[:no_devise]
run "gem install compass" unless config[:no_compass]
run "compass init --using blueprint --app rails --css-dir public/stylesheets" unless config[:no_compass]

run "rm public/stylesheets/*"

get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/dcrec1/rails3_template/raw/master/gitignore" ,".gitignore" 
get "http://github.com/dcrec1/rails3_template/raw/master/screen.scss", "app/stylesheets/screen.scss"
get "http://github.com/dcrec1/rails3_template/raw/master/print.scss", "app/stylesheets/print.scss"
get "http://github.com/dcrec1/rails3_template/raw/master/application.html.haml", "app/views/layouts/application.html.haml"
get "http://github.com/dcrec1/rails3_template/raw/master/factory_girl.rb", "features/support/factory_girl.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/devise_steps.rb", "features/step_definitions/devise_steps.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/remarkable.rb", "spec/support/remarkable.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/users.rb", "spec/support/factories/users.rb"
get "http://github.com/dcrec1/rails3_template/raw/master/build.rake", "lib/tasks/build.rake"
get "http://github.com/dcrec1/rails3_template/raw/master/build.sh", "build.sh"
get "http://github.com/dcrec1/rails3_template/raw/master/overlay.png", "public/images/overlay.png"
get "http://github.com/dcrec1/rails3_template/raw/master/newrelic.yml", "config/newrelic.yml"
get "http://github.com/dcrec1/rails3_template/raw/master/htaccess", "public/.htaccess"
get "http://github.com/dcrec1/rails3_template/raw/master/asset_packages.yml", "config/asset_packages.yml"

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
