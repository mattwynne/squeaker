Feature: Follow other users
  In order to make my own feed more interesting
  As a user
  I want to follow other users

  Background:
    Given there are these Users:
      | matt  |
      | tony  |
    And I am logged in as "matt"

  Scenario: Follow another User
    When I go to the page for the User "tony"
    And I press "Follow"
    Then I should be following "tony"

  Scenario: Follow from seasrch results
    When I search for the user "tony"
    And I press "Follow"
    Then I should be following "tony"
