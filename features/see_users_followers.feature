Feature: See users followers
  In order to explore the site
  As a visitor to a user's page
  I want to see who is following that user

  Scenario: One User being followed by 2 other users
    Given there are these Users:
      | matt  |
      | tony  |
      | dave  |
    And "matt" is following "tony"
    And "dave" is following "tony"
    When I go to the page for the User "tony"
    Then I should see that 2 users are following him
    And I should see a link to the page of each of these Users:
      | matt |
      | dave |