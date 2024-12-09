Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button

Scenario Outline: Fill the quantity of a product for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    | <product>                 |<quantity>|
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

  Examples:
  |   product                | quantity | 
  | 3 Person Dome Tent       | 2        | 
  | External Frame Backpack  | 3        |
  | Glacier Sun Glasses      | 4        | 
  | Padded Socks             | 10       | 
  | Hiking Boots             | 3        | 
  | Back Country Shorts      | 5        |


Scenario: Fill the quantity of two products for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

Scenario: Fill the quantity of three products for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

Scenario: Fill the quantity of four products for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

Scenario: Fill the quantity of five products for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
    |Back Country Shorts        | 8        |
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

Scenario: Fill the quantity of six products for buying
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |External Frame Backpack    | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
    |Hiking Boots               | 3        |
    |Back Country Shorts        | 7        |
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the ordered products above in the Product Description column
  And I should see the quantities for the products selected above in the Qty column
  And I should see the unit prices for the products selected above in the Unit Price column
  And I should see the total prices for the products selected above in the Total Price column
  And I should see the product total that it should equal the sum of all product total prices
  And I should see the sales tax that it should be calculated as 5% of the product total
  And I should see the grand total that it should equal the product total plus the sales tax and shipping

  
Scenario Outline: Fill a wrong quantity of a product by mistake
  When I type the quantities for the following products for buying
    | product              | quantity         | 
    |<product>             | <wrong_quantity> |
  And I click the "Place An Order" button
  And I see pop-up with the message "Please enter only digits in this field."
  And I click the "OK" button on the pop-up
  Then I should remain on the "OnLine Catalog" page
  And I should see the catalog with a list of products, including product names, prices, and item number

  Examples:
  |   product                | wrong_quantity | 
  | 3 Person Dome Tent       | -1             | 
  | External Frame Backpack  | -1             |
  | Glacier Sun Glasses      | -1             | 
  | Padded Socks             | -1             | 
  | Hiking Boots             | -1             | 
  | Back Country Shorts      | -1             |
  | 3 Person Dome Tent       | abc            | 
  | External Frame Backpack  | abc            |
  | Glacier Sun Glasses      | abc            | 
  | Padded Socks             | abc            | 
  | Hiking Boots             | abc            | 
  | Back Country Shorts      | abc            |  
  | 3 Person Dome Tent       | 0.1            | 
  | External Frame Backpack  | 0.1            |
  | Glacier Sun Glasses      | 0.1            | 
  | Padded Socks             | 0.1            | 
  | Hiking Boots             | 0.1            | 
  | Back Country Shorts      | 0.1            |  
