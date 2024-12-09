Given(/^I am on the GMO Browser Test page$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/browser-test.htm')
  end
  
When(/^I click on the "Green Mountain Output" image$/) do
find(:xpath, '//input[@type="image" and @name="I3"]').click
end

Then(/^I should be redirected to the error page with the URL "(.*)"$/) do |expected_url|
actual_url = page.current_url
expect(actual_url).to eq(expected_url) 
end

When(/^I click on the "Java Applet" image$/) do
find(:xpath, '//img[@src="images/java-animate2.gif"]').click
end

Then(/^I should be redirected to the Java Applet page with the URL "(.*)"$/) do |expected_url|
actual_url = page.current_url
expect(actual_url).to eq(expected_url)
end

When(/^I click on the "ActiveX" image$/) do
    find(:xpath, '//img[@src="images/ax-animate.gif"]').click
  end

Then(/^I should be redirected to the ActiveX page with the URL "(.*)"$/) do |expected_url|
    actual_url = page.current_url
    expect(actual_url).to eq(expected_url)
  end
  
# 
  
When(/^I click on the "Left or Right" button$/) do
    # Intentar encontrar el botón usando un selector más flexible
    find('input[type="button"][value=" << Left or Right >> "]').click
  end
  
  
  Then(/^I should see the alert message "(.*)"$/) do |expected_alert_message|
    # Verificar el mensaje de alerta
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(expected_alert_message)
    alert.accept
  end
  
  