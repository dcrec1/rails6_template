require 'capybara/envjs'

Evergreen.configure do |config|
  config.driver = :envjs
  config.public_dir = '/public/javascripts'
end
