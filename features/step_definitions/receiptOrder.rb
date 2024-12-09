And(/^I should see the following "(.*)" in the Product Description column of the receipt$/) do |products|
    products_list = products.split(';').map(&:strip)
    products_list.each do |product_description|
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product_description}']"
        expect(page).to have_xpath(product_xpath)
    end
end

# And I should see the "quantities" for the "<products>" in the Qty column
And(/^I should see the "(.*)" for the "(.*)" in the Qty column of the receipt$/) do |quantities, products|
    products_list = products.split(';').map(&:strip)
    quantities_list = quantities.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        quantity_xpath = "#{product_xpath}/ancestor::tr[1]/td[1][normalize-space(text())='#{quantity}']"
        expect(page).to have_xpath(quantity_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Unit Price column of the receipt$/) do |unit_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = unit_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        unit_price = prices_list[index]
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        unit_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[4][normalize-space(text())='#{unit_price}']"
        expect(page).to have_xpath(unit_price_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Total Price column of the receipt$/) do |total_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = total_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        total_price = prices_list[index]
        product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        total_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[5][normalize-space(text())='#{total_price}']"
        expect(page).to have_xpath(total_price_xpath)
    end
end

And(/^I should see the "(.*)" in the Product Total row of the receipt$/) do |product_total|
    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2][normalize-space(text())='Product Total']"
    expect(page).to have_xpath(label_xpath)
    product_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[3][normalize-space(text())='#{product_total}']"
    expect(page).to have_xpath(product_total_xpath)
end 

And(/^I should see the "(.*)" in the Sales Tax row of the receipt$/) do |sales_tax|
    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[1][normalize-space(text())='Sales Tax']"
    expect(page).to have_xpath(label_xpath)
    sales_tax_xpath = "#{label_xpath}/ancestor::tr[1]/td[2][normalize-space(text())='#{sales_tax}']"
    expect(page).to have_xpath(sales_tax_xpath)
end 

And(/^I should see the "(.*)" in the Grand Total row of the receipt$/) do |grand_total|
    label_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[1]/strong[normalize-space(text())='Grand Total']"
    expect(page).to have_xpath(label_xpath)
    grand_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[2]/strong[normalize-space(text())='#{grand_total}']"
    expect(page).to have_xpath(grand_total_xpath)
end 