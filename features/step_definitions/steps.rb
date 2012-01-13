Given /^I'm not logged in$/ do
  visit '/reset'
end

Given /^I am logged in as "([^"]*)"$/ do |username|
  visit '/reset'
  click_link 'create an account'
  fill_in 'Username', :with => username
  click_button 'Create My Account'
end

When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see "(.*)"$/ do |expected_text|
  page.should have_content(expected_text)
end
