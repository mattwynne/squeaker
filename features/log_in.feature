Feature: Log in

  Scenario: Valid user logs in
    Given a User "matt"
    When I log in as "matt"
    Then I should see "Hello matt"

  Scenario: Valid user logs in
    Given a User "matt"
    When I try to log in as "unknown-user"
    Then I should see "No user"
