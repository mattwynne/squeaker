Feature: Greet user

  Scenario: Green non-logged-in user
    Given I am not logged in
    When I visit the homepage
    Then I should see the greeting "Hello stranger!"
