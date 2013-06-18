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

When(/^I try to log in as "(.*?)"$/) do |username|
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

When(/^I search for the user "(.*?)"$/) do |username|
  fill_in 'Find users', with: username
  click_button 'Search'
end

Then(/^I should see "(.*?)" User in my followed list$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the latest (\d+) messages$/) do |num|
  expected = Message.limit(num.to_i).order(:created_at).map(&:content)
  actual = all('.message').map(&:text).map(&:strip)
  actual.should == expected
end

Then(/^I should see exactly (\d+) messages and no more$/) do |num|
  all('.message').count.should == num.to_i
end

Given(/^I am logged in$/) do
  user = create_user
  log_in_as user.username
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I should see "(.*?)" in my feed$/) do |expected_text|
  within('#messages') do
    page.should have_content(expected_text)
  end
end

Given(/^"(.*?)" is following "(.*?)"$/) do |follower, followed|
  user_named(follower).follow(user_named(followed))
end

Then(/^I should see that (\d+) users are following him$/) do |num|
  all('#followers .user').count.should == num.to_i
end

Then(/^I should see a link to the page of each of these Users:$/) do |table|
  table.raw.flatten.each do |username|
    user = user_named(username)
    page.should have_link(username, href: user_path(user))
  end
end

Given(/^the User has posted a message with the content "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the page for the User$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |expected_text|
  page.should have_content(expected_text)
end

Given(/^the User "(.*?)" has posted a message with the content "(.*?)"$/) do |username, content|
  user_named(username).post_message(content)
end
