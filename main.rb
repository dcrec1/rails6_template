run "rm -Rf .gitignore README public/index.html test app/views/layouts/*"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/Gemfile' -O Gemfile"

run "bundle"

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec
  g.fixture_replacement :factory_girl
end
GENERATORS

generate "rspec:install"
generate "cucumber:install --capybara --rspec --spork"
generate "pickle --path --email"
generate "formtastic:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/gitignore' -O .gitignore"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/application.html.haml' -O app/views/layouts/application.html.haml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/devise_steps.rb' -O features/step_definitions/devise_steps.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/users.rb' -O spec/factories/users.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/build.rake' -O lib/tasks/build.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/bootstrap.rake' -O lib/tasks/bootstrap.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/overlay.png' -O app/assets/images/overlay.png"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/newrelic.yml' -O config/newrelic.yml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/rails31/grid.png' -O app/assets/images/grid.png"

create_file 'config/deploy.rb', <<-DEPLOY
application = '#{app_name}'
repository = ''
hosts = %w()
DEPLOY

run "touch tmp/.gitkeep"

git :init
git :add => '.'
git :commit => '-am "Initial commit"'

puts "SUCCESS!"
