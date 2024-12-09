When(/^I type the "(.*)" quantities for the following "(.*)" products for buying$/) do |quantities, products|
    products_list = products.split(';').map(&:strip)
    quantities_list = quantities.split(';').map(&:strip).map(&:to_i)
 
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
end
  

# And I should see the following products in the product description
And(/^I should see the following "(.*)" in the Product Description column$/) do |products|
    products_list = products.split(';').map(&:strip)
    products_list.each do |product_description|
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product_description}']"
        expect(page).to have_xpath(product_xpath)
    end
end

# And I should see the "quantities" for the "<products>" in the Qty column
And(/^I should see the "(.*)" for the "(.*)" in the Qty column$/) do |quantities, products|
    products_list = products.split(';').map(&:strip)
    quantities_list = quantities.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        quantity_xpath = "#{product_xpath}/ancestor::tr[1]/td[1][normalize-space(text())='#{quantity}']"
        expect(page).to have_xpath(quantity_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Unit Price column$/) do |unit_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = unit_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        unit_price = prices_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        unit_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[4][normalize-space(text())='#{unit_price}']"
        expect(page).to have_xpath(unit_price_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Total Price column$/) do |total_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = total_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        total_price = prices_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        total_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[5][normalize-space(text())='#{total_price}']"
        expect(page).to have_xpath(total_price_xpath)
    end
end

And(/^I should see the "(.*)" in the Product Total row$/) do |product_total|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2][normalize-space(text())='Product Total']"
    expect(page).to have_xpath(label_xpath)
    product_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[3][normalize-space(text())='#{product_total}']"
    expect(page).to have_xpath(product_total_xpath)
end 

And(/^I should see the "(.*)" in the Sales Tax row$/) do |sales_tax|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[1][normalize-space(text())='Sales Tax']"
    expect(page).to have_xpath(label_xpath)
    sales_tax_xpath = "#{label_xpath}/ancestor::tr[1]/td[2][normalize-space(text())='#{sales_tax}']"
    expect(page).to have_xpath(sales_tax_xpath)
end 

And(/^I should see the "(.*)" in the Grand Total row$/) do |grand_total|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[1]/strong[normalize-space(text())='Grand Total']"
    expect(page).to have_xpath(label_xpath)
    grand_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[2]/strong[normalize-space(text())='#{grand_total}']"
    expect(page).to have_xpath(grand_total_xpath)
end 

When(/^I type the "(.*)" quantity for the following "(.*)" product for buying$/) do |quantity, product|  
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
    sleep 2
end

When(/^I write "(.*)" in the quantity of the product "(.*)"$/) do |quantity, product|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    row = find('tr', text: product)
    row.find('input[type="text"]').set(quantity)
  end
end
