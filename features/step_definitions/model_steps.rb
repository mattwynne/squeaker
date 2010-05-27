Given /^there is a User$/ do
  User.create(:username => "thatsme")
end

Given /^there is "([^\"]*)" User$/ do |username|
  User.create(:username => username)
end
