
Given(/^I am on the Google homepage$/) do  page.driver.browser.manage.window.maximize
  visit('https://www.google.com/')
end

When(/^I paste the GMO OnLine URL in the address bar$/) do
  visit('/')
  $home_page = HomePage.new
end

Then(/^I should see the welcome page$/) do
  $home_page.verify_page
end

And(/^I click the Enter GMO OnLine button$/) do
  $online_catalog_page = $home_page.enter_gmo_online
end
