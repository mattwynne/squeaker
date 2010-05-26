Given /^I am logged in as the User$/ do
  user = User.first
  visit user_sessions_path
  fill_in "Username", :with => user.username
  click_button "Log in"
  unless page.has_content?("hello #{user.username}")
    save_and_open_page
    raise("Page didn't contain expected text")
  end
end

When /^I visit the homepage$/ do
  visit root_path
end

Then /^I should see "([^\"]*)" in my feed$/ do |expected_text|
  unless page.has_content?(expected_text)
    save_and_open_page
    raise("I want to see #{expected_text}")
  end
end