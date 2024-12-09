Feature: Testing GMO Post Product Navigation
  As an internet user
  I want to interact with the demo GMO Post website
  So I can view and explore details of available products

Scenario: View details of a single product
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    And I click the "Enter GMO OnLine" button
    Then I should see the catalog

Scenario Outline: View details of a selected product
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    And I click the "Enter GMO OnLine" button
    And I click the "<product_name>" product
    Then I should see the product name "<product_name>"
    And I should see the product detail "<product_detail>" for "<product_name>"
    And I should see the unit price "<unit_price>" for "<product_name>"
    And I should see the product number "<product_number>" for "<product_name>"
    And I should see the product description for "<product_name>"

    Examples:
      | product_name             | product_detail                                                                                                | unit_price | product_number |
      | 3 Person Dome Tent       | Our best 3 person backpack dome tent                                                                            | $ 299.99   | 1000        |
      | External Frame Backpack  | Our most popular external frame backpack                                                                        | $ 179.95   | 1001        |
      | Glacier Sun Glasses      | Our best glacier sun glasses will protect you on your next expedition or when you hit the slopes.               | $ 67.99    | 1002        |
      | Padded Socks             | Our favorite padded socks will make your next back country trek easier on your feet.                            | $ 19.99    | 1003        |
      | Hiking Boots             | Climb any mountain with our PermaDry all leather hiking boots.                                                  | $ 109.90   | 1004        |
      | Back Country Shorts      | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp. | $ 24.95     | 1005       |

