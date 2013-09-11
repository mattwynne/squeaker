Given /^I am not logged in$/ do
  # of course you're not logged in!
end

When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the greeting "(.*?)"$/ do |expected_text|
  find('.greeting').should have_content(expected_text)
end
