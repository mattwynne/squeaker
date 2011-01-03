Given /^a User "([^"]*)"$/ do |username|
  User.create! :username => username
end

Given /^the User has \d+ Messages:$/ do |table|
  table.raw.flatten.each do |content|
    User.first.messages.create! :content => content
  end
end

When /^I make a GET request to "([^"]*)"$/ do |url|
  get url
end

Then /^I should get XML that matches the following XPath statements:$/ do |table|
  table.raw.flatten.each do |xpath|
    last_xml.xpath(xpath).should_not be_empty, "Can't find XPath: #{xpath} in:\n#{last_xml}"
  end
end

Before { get '/reset' }
