# Given I am on the Google homepage
Given(/^I am on the Google homepage$/) do
  page.driver.browser.manage.window.maximize
  visit('https://www.google.com/')
end

When(/^I paste the GMO OnLine URL in the address bar$/) do
  visit('/')
  $current_page = HomePage.new
end

Then(/^I should see the welcome page$/) do
  $current_page.verify_page
end

And(/^I click the Enter GMO OnLine button$/) do
  $current_page = $current_page.enter_gmo_online
end

And(/^I click the "(.*)" button$/) do |button_title|
  click_button(button_title)
end

# Then I should see the "<page_title>" page
Then(/^I should see the "(.*)" page$/) do |page_title|
  case page_title
  when 'OnLine Catalog'
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  when 'About This Site'
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  when 'All Browsers Are Not Created Equal'
    expect(page).to have_xpath("/html/body/h1/font")
  when 'Billing Information'
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  when 'OnLine Store Receipt'
    expect(page).to have_xpath("/html/body/h1")
  when 'Place Order'
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  else
    raise "Página con título '#{page_title}' no reconocida"
  end
end