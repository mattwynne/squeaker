require 'rubygems'
require 'capybara/dsl'
require 'test/unit/assertions'

Capybara.default_driver = :selenium
#Capybara.app_host = 'http://squeaker.heroku.com'
Capybara.app_host = 'http://localhost:3000'

World(Capybara::DSL)
World(Test::Unit::Assertions)

Before { visit '/reset' }
