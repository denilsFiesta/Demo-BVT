Feature: Testing GMO Post Product Navigation
  As an internet user
  I want to interact with the demo GMO Post website
  So I can view and explore details of available products

Background:
  Given I am on the GMO OnLine main page
  And I click the Enter GMO OnLine button

Scenario Outline: View details of a selected product
  When I click the "<product_name>" product
  Then I should see the product name "<product_name>"
  And I should see the product detail "<product_detail>" for "<product_name>"
  And I should see the unit price "<unit_price>" for "<product_name>"
  And I should see the product number "<product_number>" for "<product_name>"
  And I should see the product description for "<product_name>"

  Examples:
    | product_name             | product_detail                           | unit_price | product_number |
    | 3 Person Dome Tent       | Our best 3 person backpack dome tent     | $ 299.99   | 1000           |

    
