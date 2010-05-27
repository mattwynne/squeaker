Feature: Follow other users
  In order to make my own feed more interesting
  As a user
  I want to follow other users

  Scenario: Follow another User
    Given there are these Users:
      | matt  |
      | tony  |
    And I am logged in as "matt"
    When I go to the page for the User "tony"
    And I press "Follow"
    Then I should be following "tony"

  
  
