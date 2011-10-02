Feature: Greet user

  We need to be nice and friendly to our users,
  we're not stuffy that's what the branding people
  tell us.

  Scenario: Greet visitors who are not logged in
    Given I'm not logged in
    When I visit the homepage
    Then I should see "Hello stranger"
