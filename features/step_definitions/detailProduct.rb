# Given I am on the GMO Post homepage
Given(/^I am on the GMO Post homepage$/) do
  page.driver.browser.manage.window.maximize
  visit('https://demo.borland.com/gmopost/')
end

# Then I should see the catalog
Then(/^I should see the catalog$/) do
  expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
end

# And I click the "<product_name>" product
When(/^I click the "(.*)" product$/) do |product_name|
  click_link(product_name)
end
  
Then(/^I should see the product name "(.*)"$/) do |product_name|
  xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
  expect(page).to have_xpath(xpath)
end

And(/^I should see the product detail "(.*)" for "(.*)"$/) do |product_detail, product_name|
  h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
  expect(page).to have_xpath(h2_xpath)
  p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]/font/em[normalize-space(text())='#{product_detail}']"
  expect(page).to have_xpath(p_xpath)
end

And(/^I should see the unit price "(.*)" for "(.*)"$/) do |unit_price, product_name|
  h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
  expect(page).to have_xpath(h2_xpath)
  p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
  expect(page).to have_xpath(p_xpath)
  div_xpath = "#{p_xpath}/following-sibling::div[1]/table/tbody/tr[1]/td[3][normalize-space(text())='#{unit_price}']"
  expect(page).to have_xpath(div_xpath)
end

And(/^I should see the product number "(.*)" for "(.*)"$/) do |product_number, product_name|
  h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
  expect(page).to have_xpath(h2_xpath)
  p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
  expect(page).to have_xpath(p_xpath)
  div_xpath = "#{p_xpath}/following-sibling::div[1]/table/tbody/tr[3]/td[2][normalize-space(text())='#{product_number}']"
  expect(page).to have_xpath(div_xpath)
end

And(/^I should see the product description for "(.*)"$/) do |product_name|
  h2_xpath = "/html/body/h2[*]/a[normalize-space(text())='#{product_name}']"
  expect(page).to have_xpath(h2_xpath), "Expected to find <h2><a> with text '#{product_name}'"
  first_p_xpath = "#{h2_xpath}/ancestor::h2/following-sibling::p[1]"
  expect(page).to have_xpath(first_p_xpath), "Expected to find the first <p> after <h2> for '#{product_name}'"
  div_xpath = "#{first_p_xpath}/following-sibling::div[1]"
  expect(page).to have_xpath(div_xpath), "Expected to find a <div> after the first <p>"
  second_p_xpath = "#{div_xpath}/following-sibling::p[1][normalize-space(text()) != '']"
  expect(page).to have_xpath(second_p_xpath), "Expected to find a <p> with non-empty content after the <div>"
end


