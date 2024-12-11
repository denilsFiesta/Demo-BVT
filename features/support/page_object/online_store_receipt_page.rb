class OnlineStoreReceiptPage < BasePage
    def verify_page
        expect(page).to have_xpath("/html/body/h1")
    end

    def bill_to_info
    end

    def ship_to_info
    end

    def verify_products
        products_list = $global_products_list
        products_list.each do |product_description|
            product_xpath = "/html/body/table[2]/tbody/tr[2]/td/table/tbody/tr/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product_description}']"
            expect(page).to have_xpath(product_xpath)
        end
    end

    def verify_quantities
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

    def verify_unit_prices
        products_list = $global_products_list

        prices_list = products_list.map do |product_name|
            product = $products_db.find { |p| p[:name] == product_name }
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

    def verify_total_prices
        products_list = $global_products_list
        quantities_list = $global_quantities_list

        prices_list = products_list.map do |product_name|
            product = $products_db.find { |p| p[:name] == product_name }
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

    def verify_product_total
        products_list = $global_products_list
        quantities_list = $global_quantities_list
    
        prices_list = products_list.map do |product_name|
            product = $products_db.find { |p| p[:name] == product_name }
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

    def verify_sales_tax
        products_list = $global_products_list
        quantities_list = $global_quantities_list

        prices_list = products_list.map do |product_name|
            product = $products_db.find { |p| p[:name] == product_name }
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

    def shipping_and_handling
    end

    def verify_grand_total
        products_list = $global_products_list
        quantities_list = $global_quantities_list

        prices_list = products_list.map do |product_name|
            product = $products_db.find { |p| p[:name] == product_name }
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

    def return_to_home_page
    end
end
