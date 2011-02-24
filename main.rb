BASE_URI = "https://github.com/akitaonrails/rails3_template/raw/master/files"
I18N_BASE_URI = "https://github.com/svenfuchs/rails-i18n/raw/master/rails/locale"

run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/* config/locales/*"

run "wget --no-check-certificate '#{BASE_URI}/Gemfile' -O Gemfile"

run "bundle install"

plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git'

application  <<-GENERATORS
config.generators do |g|
  g.test_framework  :rspec, :fixture => true, :views => false
  g.integration_tool :rspec, :fixture => true, :views => true
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle --path --email"
generate "friendly_id"
generate "simple_form:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"
generate "rails_admin:install_admin"
run "compass init --using blueprint --app rails --css-dir public/stylesheets --sass-dir app/stylesheets"

append_file "config/compass.rb", "require 'lemonade'"

remove_file ".rspec"
create_file ".rspec", "--colour --drb"

run "rm public/stylesheets/*"
run "mkdir -p app/cells spec/javascripts spec/javascripts/templates"

run "wget --no-check-certificate 'https://github.com/rails/jquery-ujs/raw/master/src/rails.js' -O public/javascripts/rails.js"
run "wget --no-check-certificate '#{BASE_URI}/gitignore' -O .gitignore"
run "wget --no-check-certificate '#{BASE_URI}/screen.scss' -O app/stylesheets/screen.scss"
run "wget --no-check-certificate '#{BASE_URI}/print.scss' -O app/stylesheets/print.scss"
run "wget --no-check-certificate '#{BASE_URI}/simple_form.scss' -O app/stylesheets/simple_form.scss"
run "wget --no-check-certificate '#{BASE_URI}/application.html.erb' -O app/views/layouts/application.html.erb"
run "wget --no-check-certificate '#{BASE_URI}/factory_girl.rb' -O features/support/factory_girl.rb"
run "wget --no-check-certificate '#{BASE_URI}/devise_steps.rb' -O features/step_definitions/devise_steps.rb"
run "wget --no-check-certificate '#{BASE_URI}/users.rb' -O spec/support/factories/users.rb"
run "wget --no-check-certificate '#{BASE_URI}/build.rake' -O lib/tasks/build.rake"
run "wget --no-check-certificate '#{BASE_URI}/build.sh' -O build.sh"
run "wget --no-check-certificate '#{BASE_URI}/bootstrap.rake' -O lib/tasks/bootstrap.rake"
run "wget --no-check-certificate '#{BASE_URI}/overlay.png' -O public/images/overlay.png"
run "wget --no-check-certificate '#{BASE_URI}/newrelic.yml' -O config/newrelic.yml"
run "wget --no-check-certificate '#{BASE_URI}/rails_admin.rb' -O config/initializers/rails_admin.rb"
run "wget --no-check-certificate '#{BASE_URI}/htaccess' -O public/.htaccess"
run "wget --no-check-certificate '#{BASE_URI}/asset_packages.yml' -O config/asset_packages.yml"
run "wget --no-check-certificate '#{BASE_URI}/evergreen.rb' -O config/evergreen.rb"
run "wget --no-check-certificate '#{BASE_URI}/grid.png' -O public/images/grid.png"
run "wget --no-check-certificate '#{BASE_URI}/html5.js' -O public/javascripts/html5.js"
run "wget --no-check-certificate '#{BASE_URI}/spec_helper.rb' -O spec/spec_helper.rb"
run "wget --no-check-certificate '#{BASE_URI}/application.html' -O spec/javascripts/templates/application.html"
run "wget --no-check-certificate '#{BASE_URI}/application_spec.js' -O spec/javascripts/application_spec.js"
run "wget --no-check-certificate '#{BASE_URI}/spec_helper.js' -O spec/javascripts/spec_helper.js"
run "wget --no-check-certificate '#{BASE_URI}/watchr.rb' -O .watchr"
run "wget --no-check-certificate '#{BASE_URI}/watchr.rake' -O lib/tasks/watchr.rake"
run "wget --no-check-certificate '#{I18N_BASE_URI}/en-US.yml' -O config/locales/en.yml"
run "wget --no-check-certificate '#{I18N_BASE_URI}/pt-BR.yml' -O config/locales/pt-BR.yml"
run "wget http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js -O public/javascripts/jquery.js"
run "wget http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js -O public/javascripts/jquery-ui.js"

run "chmod u+x build.sh"

append_file 'Rakefile', <<-METRIC_FU

MetricFu::Configuration.run do |config|
  config.rcov[:rcov_opts] << "-Ispec"
end rescue nil
METRIC_FU

append_file 'config/environment.rb', <<-ASSET_PACKAGER

  Synthesis::AssetPackage.merge_environments = %w(staging production)
ASSET_PACKAGER

remove_file 'README'
create_file 'README', <<-README
== Rails 3 Application

Install Ruby 1.8.7 or Ruby Enterprise Edition (http://www.rubyenterpriseedition.com).

To run tests open a Terminal and run:

  spork

Now open a new Terminal and run:

  rake watchr

If you want to run the entire Test Suite run:

  rspec spec

With Thin, instead of 'rails server', you can start the server like this:

  thin start

README

git :init
git :add => '.'
git :add => 'public/javascripts/rails.js --force'
git :commit => '-am "Initial commit"'

puts <<-MSG

SUCCESS!

Read the README file and do not forget to change a few things. 

== Spork:

  Ensure you enable class reload within the test environment by changing the
  config/environments/test.rb to have:

    config.cache_classes = false

== Devise:

  Ensure you have defined root_url to *something* in your config/routes.rb.
  For example:

    root :to => "home#index"

MSG
