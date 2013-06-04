Feature: Follow Users
	In order to see what others are saying
	As a user
	I want to follow their feed
	
	Scenario: Existing User follows an existing User
		Given there is a User
		And I am logged in as the User
		And there is "otheruser" User
		When I visit the homepage
		And I search for "otheruser" User
		And I press "Follow"
		Then I should see "otheruser" User in my followed list
	