module ContentAssertions
  def assert_content(content)
    unless page.has_content?(content)
      save_and_open_page
      raise("Expected content '#{content}' was not found.")
    end
  end

  def assert_xpath(xpath)
    unless page.has_xpath?(xpath)
      save_and_open_page
      raise("Expected xpath '#{xpath}' was not found.")
    end
  end
end

World(ContentAssertions)

Given /^I am logged in as the User$/ do
  user = User.first
  visit user_sessions_path
  fill_in "Username", :with => user.username
  click_button "Log in"
  assert_content("hello #{user.username}")
end

When /^I visit the homepage$/ do
  visit root_path
end

Then /^I should see "([^\"]*)" in my feed$/ do |expected_text|
  within('#messages') do
    assert_content(expected_text)
  end
end

Then /^I should see the latest 10 messages$/ do
  Message.all(:limit => 10, :order => "created_at DESC").each do |message|
    within("#messages") do
      assert_content(message.content)
    end
  end
end

Then /^I should see exactly (\d+) messages and no more$/ do |expected_number|
  assert_equal(expected_number.to_i, all(:css, '#messages .message').length)
end

Then /^I should see that (\d+) users are following him$/ do |expected_number|
  assert_equal(expected_number.to_i, all(:css, '#followers .user').length)
end

Then /^I should see a link to the page of each of these Users:$/ do |table|
  table.raw.each do |row|
    username = row[0]
    expected_url = user_path(username)
    assert_xpath "//a[@href='#{expected_url}']"
  end
end