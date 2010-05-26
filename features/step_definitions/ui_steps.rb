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