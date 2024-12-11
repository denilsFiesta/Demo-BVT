class DetailItemsPage < BasePage
    def verify_page
    end

    def product_details
    end

    def verify_product_name(product_name)
        xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
        expect(page).to have_xpath(xpath)
    end

    def verify_product_detail(product_name, product_detail)
        h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
        expect(page).to have_xpath(h2_xpath)
        p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]/font/em[normalize-space(text())='#{product_detail}']"
        expect(page).to have_xpath(p_xpath)
    end
    
    def verify_unit_price(product_name, unit_price)
        h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
        expect(page).to have_xpath(h2_xpath)
        p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
        expect(page).to have_xpath(p_xpath)
        div_xpath = "#{p_xpath}/following-sibling::div[1]/table/tbody/tr[1]/td[3][normalize-space(text())='#{unit_price}']"
        expect(page).to have_xpath(div_xpath)
    end

    def verify_product_number(product_name, product_number)
        h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
        expect(page).to have_xpath(h2_xpath)
        p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
        expect(page).to have_xpath(p_xpath)
        div_xpath = "#{p_xpath}/following-sibling::div[1]/table/tbody/tr[3]/td[2][normalize-space(text())='#{product_number}']"
        expect(page).to have_xpath(div_xpath)
    end

    def verify_product_description(product_name)
        h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
        expect(page).to have_xpath(h2_xpath), "Expected to find <h2><a> with text '#{product_name}'"
        first_p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
        expect(page).to have_xpath(first_p_xpath), "Expected to find the first <p> after <h2> for '#{product_name}'"
        div_xpath = "#{first_p_xpath}/following-sibling::div[1]"
        expect(page).to have_xpath(div_xpath), "Expected to find a <div> after the first <p>"
        second_p_xpath = "#{div_xpath}/following-sibling::p[1][normalize-space(text()) != '']"
        expect(page).to have_xpath(second_p_xpath)
    end
end
