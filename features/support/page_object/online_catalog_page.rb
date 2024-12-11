class OnlineCatalogPage < BasePage
    def verify_page
    end

    def select_product(product_name)
        click_link(product_name)
        DetailItemsPage.new
    end

    def place_an_order
        click_button("Place An Order")
        PlaceOrderPage.new
    end

    def set_quantities(products_list, quantities_list)
        products_list.each_with_index do |product, index|
            quantity = quantities_list[index]
            self.set_quantity(product, quantity)
        end
        $global_products_list = products_list
        $global_quantities_list = quantities_list.map { |element| element.to_i }
    end

    def set_quantity(product_name, quantity)
        case product_name
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