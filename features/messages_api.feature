Feature: Messages API
  In order to write cool apps to display squeaker messages
  As a hacker
  I want an API that returns the squeaks from a user
  
  Scenario:
    Given a User "matt"
    And the User has 3 Messages:
      | foo |
      | bar |
      | baz |
    When I make a GET request to "/users/matt/messages.xml"
    Then I should get XML that matches the following XPath statements:
      | /messages/message/content[text()='foo']    |
      | /messages/message[3]/content[text()='baz'] |

