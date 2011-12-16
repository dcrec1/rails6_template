run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/Gemfile' -O Gemfile"

run "bundle"

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

run "mkdir -p lib/templates/factory_girl/model spec/support/factories && touch lib/templates/factory_girl/model/fixtures.rb"

generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle --path --email"
generate "formtastic:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"
run "gem install compass"
run "compass init --using blueprint --app rails --css-dir app/assets/stylesheets"

run "rm -rf public/stylesheets"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/gitignore' -O .gitignore"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/application.html.haml' -O app/views/layouts/application.html.haml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/factory_girl.rb' -O features/support/factory_girl.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/devise_steps.rb' -O features/step_definitions/devise_steps.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/remarkable.rb' -O spec/support/remarkable.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/users.rb' -O spec/support/factories/users.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/build.rake' -O lib/tasks/build.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/bootstrap.rake' -O lib/tasks/bootstrap.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/build.sh' -O build.sh"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/overlay.png' -O app/assets/images/overlay.png"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/newrelic.yml' -O config/newrelic.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/hoptoad.rb' -O config/initializers/hoptoad.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/htaccess' -O public/.htaccess"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/grid.png' -O app/assets/images/grid.png"

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

run "mkdir -p tmp"
run "touch tmp/.gitkeep"
run "chmod u+x build.sh"

git :init
git :add => '.'
git :commit => '-am "Initial commit"'

puts "SUCCESS!"
