Feature: Post message
  In order to share my crap
  As a user
  I want to post messages

  Scenario: Existing User post a message
    Given there is a User
	And I am logged in as the User
    When I visit the homepage
	And I fill in "Message" with "Hello World"
	And I press "Post"
    Then I should see "Hello World" in my feed
  
  
  
