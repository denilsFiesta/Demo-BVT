When(/^I type the quantities for the following products for buying$/) do |table|
    products_list = table.hashes.map { |row| row['product'] }
    quantities_list = table.hashes.map { |row| row['quantity'] }
 
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
  
        case product
            when "3 Person Dome Tent"
                fill_in 'QTY_TENTS', :with => quantity
            when "External Frame Backpack"
                fill_in 'QTY_BACKPACKS', :with => quantity
            when "Glacier Sun Glasses"
                fill_in 'QTY_GLASSES', :with => quantity
            when "Padded Socks"
                fill_in 'QTY_SOCKS', :with => quantity
            when "Hiking Boots"
                fill_in 'QTY_BOOTS', :with => quantity
            when "Back Country Shorts"
                fill_in 'QTY_SHORTS', :with => quantity
        end
    end
    $global_products_list = products_list
    $global_quantities_list = quantities_list.map { |element| element.to_i }
end
  

# Given I am on the GMO OnLine main page
Given("I am on the GMO OnLine main page") do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
end

# When I fill in the billing information form
When('I fill in the billing information form') do |table|
    billing_info = table.rows_hash

    fill_in 'billName', with: billing_info['Name']
    fill_in 'billAddress', with: billing_info['Address']
    fill_in 'billCity', with: billing_info['City']
    fill_in 'billState', with: billing_info['State']
    fill_in 'billZipCode', with: billing_info['Zip']
    fill_in 'billPhone', with: billing_info['Phone']
    fill_in 'billEmail', with: billing_info['E-mail']
    fill_in 'CardNumber', with: billing_info['Card Number']
    fill_in 'CardDate', with: billing_info['Expiration']
end

# And I select "Visa" from the "Credit Card" dropdown
And('I select {string} from the {string} dropdown') do |option, dropdown_label|
    dropdown_xpath = "/html/body/form/table/tbody/tr[2]/td[1]/table/tbody/tr[10]/td[2]/select"
    find(:xpath, dropdown_xpath).find(:option, option).select_option
end

And('I fill in the payment information form') do |table|
    payment_info = table.rows_hash
    fill_in 'CardNumber', with: payment_info['Card Number']
    fill_in 'CardDate', with: payment_info['Expiration']
end

# And I check the "Same as Bill To" checkbox
And('I check the {string} checkbox') do |checkbox_label|
    checkbox_xpath = "/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]/td[2]/input"
    find(:xpath, checkbox_xpath).set(true)
end


# And I fill in the shipping information form
And('I fill in the shipping information form') do |table|
    shipping_info = table.rows_hash

    fill_in 'shipName', with: shipping_info['Name']
    fill_in 'shipAddress', with: shipping_info['Address']
    fill_in 'shipCity', with: shipping_info['City']
    fill_in 'shipState', with: shipping_info['State']
    fill_in 'shipZipCode', with: shipping_info['Zip']
    fill_in 'shipPhone', with: shipping_info['Phone']
end


# And I should see the following products in the product description
And(/^I should see the ordered products above in the Product Description column of the receipt$/) do 
    products_list = $global_products_list
    products_list.each do |product_description|
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product_description}']"
        expect(page).to have_xpath(product_xpath)
    end
end

# And I should see the "quantities" for the "<products>" in the Qty column
And(/^I should see the quantities for the products selected above in the Qty column of the receipt$/) do
    products_list = $global_products_list
    quantities_list = $global_quantities_list
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        quantity_xpath = "#{product_xpath}/ancestor::tr[1]/td[1][normalize-space(text())='#{quantity}']"
        expect(page).to have_xpath(quantity_xpath)
    end
end

And(/^I should see the unit prices for the products selected above in the Unit Price column of the receipt$/) do 
    products_list = $global_products_list

    prices_list = products_list.map do |product_name|
        product = @products.find { |p| p[:name] == product_name }
        price = product[:unit_price]
       "$ #{'%.2f' % price}"
    end

    products_list.each_with_index do |product, index|
        unit_price = prices_list[index]
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        unit_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[4][normalize-space(text())='#{unit_price}']"
        expect(page).to have_xpath(unit_price_xpath)
    end
end

And(/^I should see the total prices for the products selected above in the Total Price column of the receipt$/) do
    products_list = $global_products_list
    quantities_list = $global_quantities_list

    prices_list = products_list.map do |product_name|
        product = @products.find { |p| p[:name] == product_name }
        price = product[:unit_price]
    end

    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        unit_price = prices_list[index]
        total_price = (unit_price * quantity).round(2)
        total_price = "$ #{'%.2f' % total_price}"
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        total_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[5][normalize-space(text())='#{total_price}']"
        expect(page).to have_xpath(total_price_xpath)
    end
end

And(/^I should see the product total that it should equal the sum of all product total prices of the receipt$/) do
    products_list = $global_products_list
    quantities_list = $global_quantities_list

    prices_list = products_list.map do |product_name|
        product = @products.find { |p| p[:name] == product_name }
        price = product[:unit_price]
    end

    product_total = 0.0

    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        unit_price = prices_list[index]
        total_price = (unit_price * quantity).round(2)
        product_total = product_total + total_price
    end

    product_total = "$ #{'%.2f' % product_total}"

    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2][normalize-space(text())='Product Total']"
    expect(page).to have_xpath(label_xpath)
    product_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[3][normalize-space(text())='#{product_total}']"
    expect(page).to have_xpath(product_total_xpath)
end 

And(/^I should see the sales tax that it should be calculated as 5% of the product total of the receipt$/) do 

    products_list = $global_products_list
    quantities_list = $global_quantities_list

    prices_list = products_list.map do |product_name|
        product = @products.find { |p| p[:name] == product_name }
        price = product[:unit_price]
    end

    product_total = 0.0

    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        unit_price = prices_list[index]
        total_price = (unit_price * quantity).round(2)
        product_total = product_total + total_price
    end

    sales_tax = (product_total * 0.05).round(2)
    sales_tax = "$ #{'%.2f' % sales_tax}"

    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[1][normalize-space(text())='Sales Tax']"
    expect(page).to have_xpath(label_xpath)
    sales_tax_xpath = "#{label_xpath}/ancestor::tr[1]/td[2][normalize-space(text())='#{sales_tax}']"
    expect(page).to have_xpath(sales_tax_xpath)
end 

And(/^I should see the grand total that it should equal the product total plus the sales tax and shipping of the receipt$/) do
    
    products_list = $global_products_list
    quantities_list = $global_quantities_list

    prices_list = products_list.map do |product_name|
        product = @products.find { |p| p[:name] == product_name }
        price = product[:unit_price]
    end

    product_total = 0.0

    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        unit_price = prices_list[index]
        total_price = (unit_price * quantity).round(2)
        product_total = product_total + total_price
    end

    sales_tax = (product_total * 0.05).round(2)
    grand_total = sales_tax + product_total + 5.00
    grand_total = "$ #{'%.2f' % grand_total}"
    
    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[1]/strong[normalize-space(text())='Grand Total']"
    expect(page).to have_xpath(label_xpath)
    grand_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[2]/strong[normalize-space(text())='#{grand_total}']"
    expect(page).to have_xpath(grand_total_xpath)
end 
