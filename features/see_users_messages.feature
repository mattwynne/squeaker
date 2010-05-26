Feature: See users messages
  In order to explore the site
  As a visitor
  I want to see the messages that a particular user has posted

  Scenario: Single user, single message
    Given there is a User
    And the User has posted a message with the content "This is my message"
    When I go to the page for the User
    Then I should see "This is my message"
