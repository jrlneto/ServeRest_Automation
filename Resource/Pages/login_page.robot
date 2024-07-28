*** Settings **
Resource           ../base_page.robot


*** Variables ***
${LOGIN_IPT_EMAIL}                    xpath=//input[@id="email"]
${LOGIN_IPT_PASSWORD}                 xpath=//input[@id="password"]
${LOGIN_BT_ENTER}                     xpath=//button[@type="submit"]
${LOGIN_H1_VERIFICATION}              xpath=//h1[contains(.,'Bem Vindo')]

*** Keywords ***
user is on the login page of the site
    Take Screenshot



user enters the email "${EMAIL}" and the password "${PASSWORD}"
      Fill Text    ${LOGIN_IPT_EMAIL}                   ${EMAIL}
      Fill Text    ${LOGIN_IPT_PASSWORD}                ${PASSWORD}
      Take Screenshot
      Click        ${LOGIN_BT_ENTER}
      Wait For Elements State    ${LOGIN_H1_VERIFICATION}
      Take Screenshot
      




