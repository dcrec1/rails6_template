run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/Gemfile' -O Gemfile"

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
generate "rails_admin:install_admin"
generate "barista:install"
run "gem install compass"
run "compass init --using blueprint --app rails --css-dir public/stylesheets"
append_file "config/compass.rb", "require 'lemonade'"

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
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/bootstrap.rake' -O lib/tasks/bootstrap.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/build.sh' -O build.sh"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/overlay.png' -O public/images/overlay.png"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/newrelic.yml' -O config/newrelic.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/rails_admin.rb' -O config/initializers/rails_admin.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/htaccess' -O public/.htaccess"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/asset_packages.yml' -O config/asset_packages.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/evergreen.rb' -O config/evergreen.rb"
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

append_file 'config/environment.rb', <<-ASSET_PACKAGER

  Synthesis::AssetPackage.merge_environments = %w(staging production)
ASSET_PACKAGER

run "mkdir -p app/coffeescripts spec/javascripts spec/javascripts/templates tmp"
run "touch tmp/.gitkeep"
run "chmod u+x build.sh"

git :init
git :add => '.'
git :add => 'public/javascripts/rails.js --force'
git :commit => '-am "Initial commit"'

puts "SUCCESS!"
