run "rm -Rf .gitignore README public/index.html test app/views/layouts/*"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/Gemfile' -O Gemfile"

run "bundle install --binstubs"

application  <<-GENERATORS
    config.generators do |g|
      g.template_engine :haml
      g.test_framework  :rspec
      g.fixture_replacement :factory_girl
      g.helper false
      g.assets false
      g.view_specs false
    end
GENERATORS

generate "rspec:install"
generate "formtastic:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"
generate "rails_admin:install"

run "rake db:migrate"

run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/gitignore' -O .gitignore"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/application.html.haml' -O app/views/layouts/application.html.haml"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/users.rb' -O spec/factories/users.rb"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/build.rake' -O lib/tasks/build.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/bootstrap.rake' -O lib/tasks/bootstrap.rake"
run "wget --no-check-certificate 'https://github.com/dcrec1/rails3_template/raw/master/newrelic.yml' -O config/newrelic.yml"

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
