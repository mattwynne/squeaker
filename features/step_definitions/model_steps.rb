Given /^there is a User$/ do
  User.create(:username => "matt")
end

Given /^there is "([^\"]*)" User$/ do |username|
  User.create(:username => username)
end
