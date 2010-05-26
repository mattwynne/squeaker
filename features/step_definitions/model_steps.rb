Given /^there is a User$/ do
  User.create!(:username => "matt")
end

Given /^the User has posted a message with the content "([^\"]*)"$/ do |content|
  Message.create!(:content => content, :user_id => the_user.id)
end