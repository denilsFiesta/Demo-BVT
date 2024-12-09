Feature:  
As an online shopper I want to know how the page was made.

Scenario: Look the technologies used in the site  
    Given I am on the GMO OnLine main page
    When I click the "About The GMO Site" button  
    Then I should see a list of the following technologies: 

        | HTML 3.2 |
        | HTML Browser Extensions |
        | Animation |
        | JavaScript |
        | CGI |
        | Java |
        | ActiveX |
        | Client-side processes |
        | Server-side processes |
