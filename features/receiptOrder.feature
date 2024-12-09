Feature: As an online shopper
  I want to buy some products
  so I can see de receipt of my purchase

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button

Scenario: See the receipt of External Frame Backpack purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of External Frame Backpack purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |External Frame Backpack    | 3        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of Glacier Sun Glasses purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |Glacier Sun Glasses        | 4        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of Padded Socks purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |Padded Socks               | 10       |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt

Scenario: See the receipt of Hiking Boots purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |Hiking Boots               | 3        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of Back Country Shorts purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |Back Country Shorts        | 5        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of two products purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of three products purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of four products purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of five products purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |Hiking Boots               | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
    |Back Country Shorts        | 8        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt


Scenario: See the receipt of six products purchased
  When I type the quantities for the following products for buying
    | product                   | quantity |
    |3 Person Dome Tent         | 2        |
    |External Frame Backpack    | 3        |
    |Glacier Sun Glasses        | 5        |
    |Padded Socks               | 10       |
    |Hiking Boots               | 3        |
    |Back Country Shorts        | 7        |
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button
  And I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
      | Card Number       | 1234-1234-1234-1234|
      | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the "OnLine Store Receipt" page
  And I should see the ordered products above in the Product Description column of the receipt
  And I should see the quantities for the products selected above in the Qty column of the receipt
  And I should see the unit prices for the products selected above in the Unit Price column of the receipt
  And I should see the total prices for the products selected above in the Total Price column of the receipt
  And I should see the product total that it should equal the sum of all product total prices of the receipt
  And I should see the sales tax that it should be calculated as 5% of the product total of the receipt
  And I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt
