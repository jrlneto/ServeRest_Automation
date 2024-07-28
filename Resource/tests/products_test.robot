*** Settings ***
Resource           ../base_page.robot
Resource            ../Pages/products_page.robot
Test Setup        Open Browser ServeRest
Test Teardown     Close Browser ServeRest

*** Test Cases ***
#US-0002 - Product Registration
scenario 2: Product Registration
    [Tags]    product_success
    Given i have logged in to the ServeRest page
    When i click on the register button
    And Fill in the product details
    Then I validate the registration

    #US-0003 - Delete Product
scenario 3: Delete Product
    [Tags]    delete_success
    Given i have logged in to the ServeRest page
    When i click on the product list
    Then we remove the name from the "Notebook5" list






