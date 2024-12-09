Feature: As an online shopper
  I want to enter billing and shipping information
  so I can complete my purchase

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button
  And I write "1" in the quantity of the product "3 Person Dome Tent"
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button

Scenario Outline: Complete billing information by reusing the data for the shipment
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "<payment_method>" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | <card_number>      |
    | Expiration        | 05/26              |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |
    | Phone             | 123-123-1234         |

  Examples:
  | payment_method   | card_number          |
  | American Express | 1234-123456-12345    |
  | MasterCard       | 1234-1234-1234-1234  |
  | Visa             | 1234-1234-1234-1234  |


Scenario: Complete billing information with different data for the shipment
  When I fill in the billing information form
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
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | State             | bustillo           |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                     |
    | Name              | Denis                     |
    | Address           | casa boris                |
    | FullAdress        | llallagua, bustillo 27891 |
    | Phone             | 321-321-4321              |

Scenario Outline: Complete billing information by omitting a bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | <name_field>       |
    | Address           | <address_field>    |
    | City              | <city_field>       |
    | State             | <state_field>      |
    | Zip               | <zip_field>        |
    | Phone             | <phone_field>      |
    | E-mail            | <email_field>      |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "<message>"
  And I click the "OK" button on the pop-up
  And I fill in the "<field_omitted>" bill field with "<value_field_omitted>"
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |
    | Phone             | 123-123-1234         |

  Examples:
  | name_field    | address_field   | city_field    | state_field   | zip_field   | phone_field   | email_field       | field_omitted   | value_field_omitted   | message                                         | 
  |               | casa redo       | cocha         | cercado       | 33126       | 123-123-1234  | redito@gmail.com  | Name            | Pepe                  | This is a required field.                       |
  | Pepe          |                 | cocha         | cercado       | 33126       | 123-123-1234  | redito@gmail.com  | Address         | casa redo             | This is a required field.                       |
  | Pepe          | casa redo       |               | cercado       | 33126       | 123-123-1234  | redito@gmail.com  | City            | cocha                 | This is a required field.                       |
  | Pepe          | casa redo       | cocha         |               | 33126       | 123-123-1234  | redito@gmail.com  | State           | cercado               | This is a required field.                       |
  | Pepe          | casa redo       | cocha         | cercado       |             | 123-123-1234  | redito@gmail.com  | Zip             | 33126                 | Please enter a valid zip code in this field.    |
  | Pepe          | casa redo       | cocha         | cercado       | 33126       |               | redito@gmail.com  | Phone           | 123-123-1234          | Please enter a valid phone number in this field.|
  | Pepe          | casa redo       | cocha         | cercado       | 33126       | 123-123-1234  |                   | E-mail          | redito@gmail.com      | Please enter a valid email in this field.       |                     


Scenario Outline: Complete billing information by omitting the card number payment field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "<payment_method>" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid card number of the form '<card_number>' in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Card Number" payment field with "<card_number>"
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |
    | Phone             | 123-123-1234         |

  Examples:
  | payment_method   | card_number          |
  | American Express | 1234-123456-12345    |
  | MasterCard       | 1234-1234-1234-1234  |
  | Visa             | 1234-1234-1234-1234  |

Scenario: Complete billing information by omitting the expiration payment field
  When I fill in the billing information form
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
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid date of the form 'MM/YY' in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Expiration" payment field with "05/26"
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |
    | Phone             | 123-123-1234         |

Scenario Outline: Complete billing information by omitting a ship field
  When I fill in the billing information form
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
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | <name_field>       |
    | Address           | <address_field>    |
    | City              | <city_field>       |
    | State             | <state_field>      |
    | Zip               | <zip_field>        |
    | Phone             | <phone_field>      |
  And I click the "Place The Order" button
  And I see pop-up with the message "<popup_message>"
  And I click the "OK" button on the pop-up
  And I fill in the "<field_omitted>" ship field with "<value_field_omitted>"
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                     |
    | Name              | Denis                     |
    | Address           | casa boris                |
    | FullAdress        | llallagua, bustillo 27891 |
    | Phone             | 321-321-4321              |

  Examples:
  | name_field    | address_field   | city_field    | state_field   | zip_field   | phone_field   | field_omitted   | value_field_omitted   | popup_message                                   | 
  |               | casa boris      | llallagua     | bustillo      | 27891       | 321-321-4321  | Name            | Denis                 | This is a required field.                       |
  | Denis         |                 | llallagua     | bustillo      | 27891       | 321-321-4321  | Address         | casa boris            | This is a required field.                       |
  | Denis         | casa boris      |               | bustillo      | 27891       | 321-321-4321  | City            | llallagua             | This is a required field.                       |
  | Denis         | casa boris      | llallagua     |               | 27891       | 321-321-4321  | State           | bustillo              | This is a required field.                       |
  | Denis         | casa boris      | llallagua     | bustillo      |             | 321-321-4321  | Zip             | 27891                 | Please enter a valid zip code in this field.    |
  | Denis         | casa boris      | llallagua     | bustillo      | 27891       |               | Phone           | 321-321-4321          | Please enter a valid phone number in this field.|               

