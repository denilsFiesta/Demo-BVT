class BasePage
    include Capybara::DSL
    include RSpec::Matchers

    def initialize
        verify_page
    end

    def verify_page
    end
end
