Given(/^I am not logged in$/) do
  # noop
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see the greeting "(.*?)"$/) do |arg1|
  page.should have_text(arg1)
end
