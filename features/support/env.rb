require 'capybara/cucumber'

Capybara.app_host = 'http://localhost:3000'
Capybara.default_driver = :selenium

Before do
  visit '/reset'
end
