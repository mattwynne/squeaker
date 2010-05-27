Given /^I am logged in as the User$/ do
  user = User.find_by_username "thatsme"
  visit user_sessions_path
  fill_in "Username", :with => user.username
  click_button "Log in"
  # assert page.has_content?("hellooo #{user.username}"), "Didn't find 'hello' stuff"
  unless page.has_content?("hello #{user.username}")
    save_and_open_page
    raise "There's no greeting after login!!"
  end
end

When /^I visit the homepage$/ do
  visit root_path
end

Then /^I should see "([^\"]*)" in my feed$/ do |arg1|
  assert page.has_content?(arg1), "Message '#{arg1}' not in the feed as expected"
end

When /^I search for another User$/ do
  fill_in "Search", :with => "otheruser"
  click_button "Search"
end

When /^I search for "([^\"]*)" User$/ do |username|
  fill_in "Search", :with => "username"
  click_button "Search"
end

Then /^I should see "([^\"]*)" User in my followed list$/ do |username|
  pending # express the regexp above with the code you wish you had
end
