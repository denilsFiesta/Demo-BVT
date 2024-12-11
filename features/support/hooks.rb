After do |scenario|
  if scenario.failed?
    save_screenshot("screenshots/#{scenario.name}.png")
  end
  Capybara.reset_sessions!
end

After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

Around do |scenario, block|
  start_time = Time.now
  block.call
  duration = Time.now - start_time
  puts "El escenario '#{scenario.name}' tardó #{duration.round(2)} segundos en ejecutarse."
end

Before do
  $products_db = [
    { name: "3 Person Dome Tent", unit_price: 299.99 },
    { name: "External Frame Backpack", unit_price: 179.95 },
    { name: "Glacier Sun Glasses", unit_price: 67.99 },
    { name: "Padded Socks", unit_price: 19.99 },
    { name: "Hiking Boots", unit_price: 109.90 },
    { name: "Back Country Shorts", unit_price: 24.95 }
  ]
end

After do
  $global_products_list = nil
  $global_quantities_list = nil
end
