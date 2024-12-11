When(/^I click the "(.*)" product$/) do |product_name|
  $detail_items_page = $online_catalog_page.select_product(product_name)
end
  
Then(/^I should see the product name "(.*)"$/) do |product_name|
  $detail_items_page.verify_product_name(product_name)
end

And(/^I should see the product detail "(.*)" for "(.*)"$/) do |product_detail, product_name|
  $detail_items_page.verify_product_detail(product_name, product_detail)
end

And(/^I should see the unit price "(.*)" for "(.*)"$/) do |unit_price, product_name|
  $detail_items_page.verify_unit_price(product_name, unit_price)
end

And(/^I should see the product number "(.*)" for "(.*)"$/) do |product_number, product_name|
  $detail_items_page.verify_product_number(product_name, product_number)
end

And(/^I should see the product description for "(.*)"$/) do |product_name|
  $detail_items_page.verify_product_description(product_name)
end


