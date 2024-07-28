*** Settings ***
Resource           ../base_page.robot
Resource           ../Pages/login_page.robot
Test Setup        Open Browser ServeRest
Test Teardown     Close Browser ServeRest

*** Test Cases ***
#US-0001 - Successfully log in
scenario 1: Successfully log in
    [Tags]    login_success
    Given user is on the login page of the site
    Then user enters the email "netoa@oi.com" and the password "1234"

