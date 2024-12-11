class PlaceOrderPage < BasePage
    def verify_page
    end

    def proceed_with_order
        click_button("Proceed With Order")
        BillingInformationPage.new
    end
end
