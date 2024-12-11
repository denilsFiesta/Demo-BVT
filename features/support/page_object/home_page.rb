class HomePage < BasePage
    def verify_page
        expect(page).to have_xpath("/html/body/h1/font")
    end

    def enter_gmo_online
    end

    def about_gmo_site
    end
end
