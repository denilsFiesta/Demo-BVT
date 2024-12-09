Given(/^I am on the GMO Browser Test page$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/browser-test.htm')
  end
  
When(/^I click on the "Green Mountain Output" image$/) do
find(:xpath, '//input[@type="image" and @name="I3"]').click
end

When(/^I click on the "Java Applet" image$/) do
find(:xpath, '//img[@src="images/java-animate2.gif"]').click
end

When(/^I click on the "ActiveX" image$/) do
    find(:xpath, '//img[@src="images/ax-animate.gif"]').click
  end

Then(/^I should be redirected to the "(.*)" page$/) do |title_page|
  expect(page).to have_xpath("/html/body/p[1]/img")
end
  
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
  
  