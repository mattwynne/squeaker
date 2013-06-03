Feature: Greet user

  Scenario: Greet non-logged in user
    Given I am not logged in
    When I visit the homepage
    Then I should see "Hello stranger!"
