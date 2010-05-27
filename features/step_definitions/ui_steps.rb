Given /^I am logged in as the User$/ do
  user = User.find_by_username "matt"
  visit user_sessions_path
  fill_in "Username", :with => user.username
  click_button "Log in"
  
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

When /^I search for "([^\"]*)" User$/ do |username|
  fill_in "Find users", :with => "username"
  click_button "Search"
end

Then /^I should see "([^\"]*)" User in my followed list$/ do |username|
  unless page.has_content?("People I follow") and page.has_content?(username)
    save_and_open_page
    raise "Followed user is not there"
  end
end
