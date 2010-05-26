Given /^there is a User$/ do
  User.create!(:username => "matt")
end

Given /^there are these Users:$/ do |table|
  table.raw.each do |row|
    username = row[0]
    User.create!(:username => username)
  end
end

Given /^the User has posted a message with the content "([^\"]*)"$/ do |content|
  Message.create!(:content => content, :user_id => the_user.id)
end

Given /^the User "([^\"]*)" has posted a message with the content "([^\"]*)"$/ do |username, content|
  user = User.find_by_username(username)
  Message.create!(:content => content, :user_id => user.id)
end

Given /^there are 11 messages, each with different content$/ do
  11.times do |i|
    Message.create!(:content => "This is message number #{i + 1}")
  end
end

Given /^"([^\"]*)" is following "([^\"]*)"$/ do |following_username, followed_username|
  usernames = [followed_username, following_username]
  users = usernames.map { |username| User.find_by_username(username) }
  followed_user, following_user = users
  following_user.follow(followed_user)
end
