Feature:  
As a thoughtful site visitor, I want to verify the links behind the images on the Browser Test page  
to ensure the site operates as expected and handles errors gracefully.  

Scenario: Redirect to "Green Mountain Outpost" when clicking on the GMO image
    Given I am on the GMO Browser Test page
    When I click on the "Green Mountain Output" image
    Then I should be redirected to the "Green Mountain Outpost" page

Scenario: Redirect to the "Java Applet" page when clicking on the Java animation image
    Given I am on the GMO Browser Test page
    When I click on the "Java Applet" image
    Then I should be redirected to the "Java Applet" page

Scenario: Redirect to the "ActiveX" page when clicking on the ActiveX animation image
    Given I am on the GMO Browser Test page
    When I click on the "ActiveX" image
    Then I should be redirected to the "ActiveX" page

Scenario: Verify the "Left or Right" button functionality
  Given I am on the GMO Browser Test page
  When I click on the "Left or Right" button
  Then I should see the alert message "This button AND the GMO image should be on the right edge of the page!"
