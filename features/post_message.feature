Feature: Post message
  In order to share my thoughts
  As a user
  I want to post messages

  Scenario: Existing User posts a message
    And I am logged in
    When I visit the homepage
    And I fill in "Squeak something!" with "Hello World"
    And I press "Squeak"
    Then I should see "Hello World" in my feed
