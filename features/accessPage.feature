Feature: As an internet user
    I want to use the GMO online page
    so I can ensure that it works correctly

Scenario: Access the GMO OnLine homepage
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    Then I should see the welcome page

Scenario Outline: Verify navigation after pressing buttons on the GMO OnLine page
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    And I click the "<button_title>" button
    Then I should see the "<page_title>" page

    Examples:
    | button_title         | page_title                        |   
    | Enter GMO OnLine     | OnLine Catalog                    |   
    | About The GMO Site   | About This Site                   |
    | Browser Test Page    | All Browsers Are Not Created Equal| 