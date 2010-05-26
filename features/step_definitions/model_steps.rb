Given /^there is a User$/ do
  User.create(:username => "matt")
  sleep 5
end
