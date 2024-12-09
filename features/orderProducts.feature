Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button

Scenario Outline: Fill the quantity of many different products for buying
	When I type the "<quantities>" quantities for the following "<products>" products for buying
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the following "<products>" in the Product Description column
  And I should see the "<quantities>" for the "<products>" in the Qty column
  And I should see the "<unit_prices>" for the "<products>" in the Unit Price column
  And I should see the "<total_prices>" for the "<products>" in the Total Price column
  And I should see the "<product_total>" in the Product Total row
  And I should see the "<sales_tax>" in the Sales Tax row
  And I should see the "<grand_total>" in the Grand Total row

  Examples:
  |   products                                                                                                             |   quantities   |   unit_prices                             |   total_prices                                              |   product_total   |   sales_tax   |   grand_total   |
  | 3 Person Dome Tent                                                                                                     | 2              | $ 299.99                                  | $ 599.98                                                    | $ 599.98          | $ 30.00       | $ 634.98        |
  | External Frame Backpack                                                                                                | 3              | $ 179.95                                  | $ 539.85                                                    | $ 539.85          | $ 26.99       | $ 571.84        |
  | Glacier Sun Glasses                                                                                                    | 4              | $ 67.99                                   | $ 271.96                                                    | $ 271.96          | $ 13.60       | $ 290.56        |
  | Padded Socks                                                                                                           | 10             | $ 19.99                                   | $ 199.90                                                    | $ 199.90          | $ 9.99        | $ 214.89        |
  | Hiking Boots                                                                                                           | 3              | $ 109.90                                  | $ 329.70                                                    | $ 329.70          | $ 16.49       | $ 351.19        |
  | Back Country Shorts                                                                                                    | 5              | $ 24.95                                   | $ 124.75                                                    | $ 124.75          | $ 6.24        | $ 135.99        |
  | 3 Person Dome Tent; Hiking Boots                                                                                       | 2; 3           | $ 299.99; $ 109.90                        | $ 599.98; $ 329.70                                            | $ 929.68          | $ 46.48       | $ 981.16        |
  | 3 Person Dome Tent; Hiking Boots; Glacier Sun Glasses                                                                   | 2; 3; 5        | $ 299.99; $ 109.90; $ 67.99                | $ 599.98; $ 329.70; $ 339.95                                | $ 1269.63         | $ 63.48       | $ 1338.11      |
  | 3 Person Dome Tent; Hiking Boots; Glacier Sun Glasses; Padded Socks                                                    | 2; 3; 5; 10    | $ 299.99; $ 109.90; $ 67.99; $ 19.99        | $ 599.98; $ 329.70; $ 339.95; $ 199.90                       | $ 1469.53         | $ 73.48       | $ 1548.01      |
  | 3 Person Dome Tent; Hiking Boots; Glacier Sun Glasses; Padded Socks; Back Country Shorts                                | 2; 3; 5; 10; 8 | $ 299.99; $ 109.90; $ 67.99; $ 19.99; $ 24.95 | $ 599.98; $ 329.70; $ 339.95; $ 199.90; $ 199.60             | $ 1669.13         | $ 83.46       | $ 1757.59      |
  | 3 Person Dome Tent; External Frame Backpack; Glacier Sun Glasses; Padded Socks; Hiking Boots; Back Country Shorts     | 2; 3; 5; 10; 3; 7 | $ 299.99; $ 179.95; $ 67.99; $ 19.99; $ 109.90; $ 24.95 | $ 599.98; $ 539.85; $ 339.95; $ 199.90; $ 329.70; $ 174.65   | $ 2184.03          | $ 109.20      | $ 2298.23       |


Scenario Outline: Fill a wrong quantity of a product by mistake and then correcting it later on
  When I type the "<wrong_quantity>" quantity for the following "<product>" product for buying
  And I click the "Place An Order" button
  And I see pop-up with the message "Please enter only digits in this field."
  And I click the "OK" button on the pop-up
  And I type the "<correct_quantity>" quantity for the following "<product>" product for buying
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the following "<product>" in the Product Description column
  And I should see the "<correct_quantity>" for the "<product>" in the Qty column
  And I should see the "<unit_prices>" for the "<products>" in the Unit Price column
  And I should see the "<total_prices>" for the "<products>" in the Total Price column
  And I should see the "<product_total>" in the Product Total row
  And I should see the "<sales_tax>" in the Sales Tax row
  And I should see the "<grand_total>" in the Grand Total row

  Examples:
  |   product                           | wrong_quantity | correct_quantity|   unit_prices |   total_prices  |   product_total   |   sales_tax   |   grand_total   |
  | 3 Person Dome Tent                  | -1             | 2               | $ 299.99      | $ 599.98        | $ 599.98          | $ 30.00       | $ 634.98        |
  | External Frame Backpack             | -1             | 3               | $ 179.95      | $ 539.85        | $ 539.85          | $ 26.99       | $ 571.84        |
  | Glacier Sun Glasses                 | -1             | 4               | $ 67.99       | $ 271.96        | $ 271.96          | $ 13.60       | $ 290.56        |
  | Padded Socks                        | -1             | 10              | $ 19.99       | $ 199.90        | $ 199.90          | $ 9.99        | $ 214.89        |
  | Hiking Boots                        | -1             | 3               | $ 109.90      | $ 329.70        | $ 329.70          | $ 16.49       | $ 351.19        |
  | Back Country Shorts                 | -1             | 5               | $ 24.95       | $ 124.75        | $ 124.75          | $ 6.24        | $ 135.99        |
  | 3 Person Dome Tent                  | 0.1            | 2               | $ 299.99      | $ 599.98        | $ 599.98          | $ 30.00       | $ 634.98        |
  | External Frame Backpack             | 0.1            | 3               | $ 179.95      | $ 539.85        | $ 539.85          | $ 26.99       | $ 571.84        |
  | Glacier Sun Glasses                 | 0.1            | 4               | $ 67.99       | $ 271.96        | $ 271.96          | $ 13.60       | $ 290.56        |
  | Padded Socks                        | 0.1            | 10              | $ 19.99       | $ 199.90        | $ 199.90          | $ 9.99        | $ 214.89        |
  | Hiking Boots                        | 0.1            | 3               | $ 109.90      | $ 329.70        | $ 329.70          | $ 16.49       | $ 351.19        |
  | Back Country Shorts                 | 0.1            | 5               | $ 24.95       | $ 124.75        | $ 124.75          | $ 6.24        | $ 135.99        |
  | 3 Person Dome Tent                  | abc            | 2               | $ 299.99      | $ 599.98        | $ 599.98          | $ 30.00       | $ 634.98        |
  | External Frame Backpack             | abc            | 3               | $ 179.95      | $ 539.85        | $ 539.85          | $ 26.99       | $ 571.84        |
  | Glacier Sun Glasses                 | abc            | 4               | $ 67.99       | $ 271.96        | $ 271.96          | $ 13.60       | $ 290.56        |
  | Padded Socks                        | abc            | 10              | $ 19.99       | $ 199.90        | $ 199.90          | $ 9.99        | $ 214.89        |
  | Hiking Boots                        | abc            | 3               | $ 109.90      | $ 329.70        | $ 329.70          | $ 16.49       | $ 351.19        |
  | Back Country Shorts                 | abc            | 5               | $ 24.95       | $ 124.75        | $ 124.75          | $ 6.24        | $ 135.99        |
  