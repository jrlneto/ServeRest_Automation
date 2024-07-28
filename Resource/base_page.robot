*** Settings ***
Library    Browser
Library    String


*** Variables ***
${BROWSER}    https://front.serverest.dev/


*** Keywords ***
#testes remotos pelo Open Browser
Open Browser ServeRest
    New Browser   browser=chromium  headless=false
    Browser.Open Browser    ${BROWSER}
    Take Screenshot

Close Browser ServeRest
    Browser.Close Browser
