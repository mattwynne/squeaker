Feature: Home page
  In order to get users onto our site
  visitors to the site
  should be shown an exciting homepage
  
  Scenario: Visit the homepage without logging in
    Given there are 11 messages, each with different content
    When I visit the homepage
    Then I should see the latest 10 messages
    And I should see exactly 10 messages and no more
