module UserSupport
  def create_user(attributes={})
    User.create! default_user_attributes.merge(attributes)
  end

  def ensure_account_for(username)
    return if user_named(username)
    create_user(username: username)
  end

  def user_named(username)
    User.find_by_username(username)
  end

  def default_user_attributes
    { username: "username-#{UserSupport.unique_number}" }
  end

  def self.unique_number
    @number ||= 0
    @number += 1
  end
end

module UISupport
  attr_reader :logged_in_user

  def log_in_as(username)
    visit '/'
    click_link 'log in'
    fill_in 'Username', with: username
    click_button 'Log in'
    @logged_in_user = user_named(username)
  end
end

World(UserSupport, UISupport)

Given /^a User "([^"]*)"$/ do |username|
  create_user(username: username)
end

Given /^the User has \d+ Messages:$/ do |table|
  table.raw.flatten.each do |content|
    User.first.messages.create! :content => content
  end
end

Given(/^there are these Users:$/) do |table|
  table.raw.flatten.each do |username|
    create_user(username: username)
  end
end

Given(/^I am logged in as "(.*?)"$/) do |username|
  ensure_account_for(username)
  log_in_as username
end

When(/^I log in as "(.*?)"$/) do |username|
  ensure_account_for(username)
  log_in_as username
end

When(/^I go to the page for the User "(.*?)"$/) do |username|
  visit user_path(username)
end

When(/^I press "(.*?)"$/) do |button_label|
  click_button button_label
end

Then(/^I should be following "(.*?)"$/) do |other_username|
  logged_in_user.should be_following(user_named(other_username))
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then /^I should see the greeting "(.*?)"$/ do |expected_text|
  find('.greeting').should have_content(expected_text)
end

Given(/^the User "(.*?)" has posted a message with the content "(.*?)"$/) do |username, content|
  user_named(username).post_message(content)
end
