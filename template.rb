def commit(name, gem: false, group: false, generators: [], github: nil)
  gem_params = github ? { github: github } : {}
  group ?  gem_group(*group) { gem name, gem_params } : gem(name, gem_params) if gem
  generators.each { |generator| after_bundle { generate *generator } }
  yield if block_given?
  git add: '.'
  git commit: "-am 'add #{name}'"
end

git :init
git add: '.'
git commit: "-am 'Initial commit'"

commit 'haml', gem: true

commit 'devise', gem: true, generators: ['devise:install', ['devise', 'Admin']]

commit 'friendly_id', gem: true, generators: %w(friendly_id)
commit 'rspec-rails', gem: true, group: [:development, :test], generators: %w(rspec:install)
commit 'spring-commands-rspec', gem: true, group: :development
commit 'factory_bot', gem: true, group: :test
commit 'capybara', gem: true, group: :test
commit 'simple_form', gem: true, generators: [['simple_form:install', '--bootstrap']]
commit 'binding_of_caller', gem: true, group: :development
commit 'better_errors', gem: true, group: :development
commit 'inherited_resources', gem: true, github: 'josevalim/inherited_resources'
commit 'rubocop-rails', gem: true, group: :development
commit 'simplecov', gem: true, group: :test do
  run 'touch .gitignore'
  run 'echo coverage >> .gitignore'
end
commit 'selenium-webdriver', gem: true, group: :test
commit 'rollbar', gem: true

commit 'dotenv-rails', gem: true, group: :development do
  run 'touch .env'
end

commit 'Procfile' do
  file 'Procfile', <<-PROCFILE
db: postgres -D /usr/local/var/postgres
redis: redis-server /usr/local/etc/redis.conf
web: rails s
  PROCFILE
end
commit 'db:bootstrap task' do
  file 'lib/tasks/bootstrap.rake', <<-TASK
namespace :db do
  desc 'Bootstraps with demo data'
  task bootstrap: :environment do
  end
end
  TASK
end

commit 'factories file' do
  file 'spec/support/factories.rb', <<-FACTORIES
FactoryBot.define do
end
  FACTORIES
end

application <<-GENERATORS
    config.generators do |g|
      g.assets false
      g.helper false
      g.controller_specs false
      g.request_specs false
      g.view_specs false
    end
GENERATORS
git add: '.'
git commit: "-am 'configure generators'"

after_bundle do
  rake "db:create db:migrate"
  git add: '.'
  git commit: "-am 'migrate database'"
  
  git add: '.'
  git commit: "-am 'install binstubs'"
  puts <<-CODE
    # ADD TO spec/rails_helper.rb

    require 'simplecov'
    SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
    SimpleCov.start

    config.include FactoryBot::Syntax::Methods

    config.before :each, type: :system do
      driven_by :selenium, using: :headless_chrome
    end
  CODE
end
