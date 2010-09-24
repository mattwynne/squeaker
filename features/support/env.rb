require 'rubygems'
require 'watir-webdriver'
require 'test/unit'

module Helper
  class << self
    attr_accessor :host
  end
  
  def self.browser
    return @browser if @browser
    @browser = open_browser
  end
  
  def self.open_browser
    @browser = Watir::Browser.new(:firefox)
    # at_exit { @browser.close }
    @browser.goto(host)
    @browser
  end
  
  def browser
    @browser = Helper.browser
  end
  
  def method_missing(method_name, *args)
    browser.send(method_name, *args)
  end
  
  def create_user(name)
    visit("/users/new")
    input(:id => "user_username").send_keys(name)
    button(:text => "Create My Account").click
  end
  
  def visit(path)
    url = "#{Helper.host}#{path}"
    goto url
  end
end

Helper.host = "http://localhost:3000"

World(Helper)
World(Test::Unit::Assertions)

Before { visit "/reset" }

Given /^there are (\d+) messages, each with different content$/ do |num|
  num.to_i.times do |i|
    create_message("Message #{num}")
  end
end

Given /^I am logged in$/ do
  create_user("matt")
end

When /^I visit the homepage$/ do
  visit '/'
end

When /^I fill in "(.*)" with "(.*)"$/ do |label, text|
  id = label(:text => label).for
  input(:id => id).send_keys(text)
end

When /^I press "([^"]*)"$/ do |button_text|
  button(:text => button_text).click
end

Then /^I should see "([^"]*)" in my feed$/ do |message|
  assert true, li(:text => message).exists?
end