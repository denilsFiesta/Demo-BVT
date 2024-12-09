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

