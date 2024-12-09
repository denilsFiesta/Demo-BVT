# Given I am on the Google homepage
Given(/^I am on the Google homepage$/) do
  page.driver.browser.manage.window.maximize
  visit('/')
end

# When I paste the GMO OnLine URL in the address bar
When(/^I paste the GMO OnLine URL in the address bar$/) do
  visit('https://demo.borland.com/gmopost/')
end

# Then I should see the welcome page
Then(/^I should see the welcome page$/) do
  expect(page).to have_xpath("/html/body/h1/font")
end

# And I click the "<button_title>" button
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