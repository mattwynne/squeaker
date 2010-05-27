Feature: See users messages
  In order to explore the site
  As a visitor to a Users' page
  I want to see messages posted by that User and the Users they're following

  Scenario: Single user, single message
    Given there is a User
    And the User has posted a message with the content "This is my message"
    When I go to the page for the User
    Then I should see "This is my message"

  Scenario: Following one other User
    Given there are these Users:
      | matt |
      | tony |
    And the User "tony" has posted a message with the content "This is what tony has to say"
    And the User "matt" has posted a message with the content "blah blah blah Ruby blah"
    And "matt" is following "tony"
    When I go to the page for the User "matt"
    Then I should see exactly 2 messages and no more
    And I should see "This is what tony has to say"
