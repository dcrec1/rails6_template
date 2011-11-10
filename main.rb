run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"

run "wget --no-check-certificate 'https://raw.github.com/emersonvinicius/rails3_template/master/Gemfile' -O Gemfile"

run "bundle install"

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.integration_tool :rspec, :fixture => true, :views => true
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

generate "rspec:install"
generate "formtastic:install"
generate "devise:install"

run "wget --no-check-certificate 'https://raw.github.com/emersonvinicius/rails3_template/master/gitignore' -O .gitignore"

run "wget --no-check-certificate 'https://raw.github.com/emersonvinicius/rails3_template/master/remarkable.rb' -O spec/support/remarkable.rb"

run "wget --no-check-certificate 'https://raw.github.com/emersonvinicius/rails3_template/master/bootstrap.rake' -O lib/tasks/bootstrap.rake"

create_file 'config/deploy.rb', <<-DEPLOY
application = '#{app_name}'
repository = ''
hosts = %w()
DEPLOY

run "mkdir -p tmp"
run "touch tmp/.gitkeep"

git :init
git :add => '.'
git :commit => '-am "Initial commit"'
