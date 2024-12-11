class BasePage
    include Capybara::DSL

    def initialize
        verify_page
    end

    def verify_page
    end
end
