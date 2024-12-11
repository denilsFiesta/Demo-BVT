Given("I am on the GMO OnLine main page") do
    page.driver.browser.manage.window.maximize
    visit('/')
    $current_page = HomePage.new
end

When(/^I type the quantities for the following products for buying$/) do |table|
    products_list = table.hashes.map { |row| row['product'] }
    quantities_list = table.hashes.map { |row| row['quantity'] }
    $current_page.set_quantities(products_list, quantities_list)
end
  
And(/^I click the Place An Order button$/) do
    $current_page = $current_page.place_an_order
end

And(/^I click the Proceed With Order button$/) do
    $current_page = $current_page.proceed_with_order
end

And(/^I click the Place The Order button$/) do
    $current_page = $current_page.place_the_order
end

When('I fill in the billing information form') do |table|
    billing_info = table.rows_hash

    $current_page.fill_billing_info(
        name: billing_info['Name'],
        address: billing_info['Address'],
        city: billing_info['City'],
        state: billing_info['State'],
        zip: billing_info['Zip'],
        phone: billing_info['Phone'],
        email: billing_info['E-mail']
    )
end

And('I select {string} from the Credit Card dropdown') do |option|
    $current_page.select_card_type(option)
end

And('I fill in the payment information form') do |table|
    payment_info = table.rows_hash
    $current_page.fill_payment_info(
        card_number: payment_info['Card Number'],
        expiration: payment_info['Expiration']
    )
end

And('I check the Same as Bill To checkbox') do 
    $current_page.copy_bill_to_ship
end

Then(/^I should see the OnLine Store Receipt page$/) do
    $current_page.verify_page
  end

And('I fill in the shipping information form') do |table|
    shipping_info = table.rows_hash

    $current_page.fill_shipping_info(
        name: shipping_info['Name'],
        address: shipping_info['Address'],
        city: shipping_info['City'],
        state: shipping_info['State'],
        zip: shipping_info['Zip'],
        phone: shipping_info['Phone'],
    )
end

# And I should see the following products in the product description
And(/^I should see the ordered products above in the Product Description column of the receipt$/) do 
    $current_page.verify_products
end

# And I should see the "quantities" for the "<products>" in the Qty column
And(/^I should see the quantities for the products selected above in the Qty column of the receipt$/) do
    $current_page.verify_quantities
end

And(/^I should see the unit prices for the products selected above in the Unit Price column of the receipt$/) do 
    $current_page.verify_unit_prices
end

And(/^I should see the total prices for the products selected above in the Total Price column of the receipt$/) do
    $current_page.verify_total_prices
end

And(/^I should see the product total that it should equal the sum of all product total prices of the receipt$/) do
    $current_page.verify_product_total
end 

And(/^I should see the sales tax that it should be calculated as 5% of the product total of the receipt$/) do 
    $current_page.verify_sales_tax
end 

And(/^I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt$/) do
    $current_page.verify_grand_total
end 
