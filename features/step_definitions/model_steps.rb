Given /^there is a User$/ do
  User.create!(:username => "matt")
end

Given /^the User has posted a message with the content "([^\"]*)"$/ do |content|
  Message.create!(:content => content, :user_id => the_user.id)
end

Given /^there are 11 messages, each with different content$/ do
  11.times do |i|
    Message.create!(:content => "This is message number #{i + 1}")
  end
end
