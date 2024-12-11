class BillingInformationPage < BasePage
    def verify_page
    end

    def fill_billing_info(name:, address:, city:, state:, zip:, phone:, email:)
        fill_in 'billName', with: name
        fill_in 'billAddress', with: address
        fill_in 'billCity', with: city
        fill_in 'billState', with: state
        fill_in 'billZipCode', with: zip
        fill_in 'billPhone', with: phone
        fill_in 'billEmail', with: email
    end
      
    def select_card_type(option)
        dropdown_xpath = "/html/body/form/table/tbody/tr[2]/td[1]/table/tbody/tr[10]/td[2]/select"
        find(:xpath, dropdown_xpath).find(:option, option).select_option
    end

    def fill_payment_info(card_number:, expiration:)
        fill_in 'CardNumber', with: card_number
        fill_in 'CardDate', with: expiration
    end

    def copy_bill_to_ship
        checkbox_xpath = "/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]/td[2]/input"
        find(:xpath, checkbox_xpath).set(true)
    end

    def fill_shipping_info(name:, address:, city:, state:, zip:, phone:)
        fill_in 'shipName', with: name
        fill_in 'shipAddress', with: address
        fill_in 'shipCity', with: city
        fill_in 'shipState', with: state
        fill_in 'shipZipCode', with: zip
        fill_in 'shipPhone', with: phone
    end

    def place_the_order
        click_button("Place The Order")
        OnlineStoreReceiptPage.new
    end
end