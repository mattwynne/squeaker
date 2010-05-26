Given /^I am logged in as the User$/ do
  user = User.first
  visit user_sessions_path
  fill_in "Username", :with => user.username
  click_button "Log in"
  # assert page.has_content?("hellooo #{user.username}"), "Didn't find 'hello' stuff"
  unless page.has_content?("hello #{user.username}")
    save_and_open_page
    raise "Ouch!!"
  end
end

When /^I visit the homepage$/ do
  visit root_path
end

Then /^I should see "([^\"]*)" in my feed$/ do |arg1|
  assert page.has_content?(arg1), "Message '#{arg1}' not in the feed as expected"
end
