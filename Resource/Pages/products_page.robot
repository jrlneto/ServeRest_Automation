*** Settings **
Resource           ../base_page.robot
Resource           login_page.robot




*** Variables ***
${HOME_BT_REGISTRATION}               xpath=//a[@data-testid='cadastrarProdutos'][contains(.,'Cadastrar')]
${HOME_BT_VERIFICATION}               xpath=//h1[contains(.,'Cadastro de Produtos')]
${REGISTER_PRODUCTS_IPT_NAME}         xpath=//input[@name='nome']
${REGISTER_PRODUCTS_IPT_PRICE}        xpath=//input[@name='price']
${REGISTER_PRODUCTS_IPT_DESCRIPTION}  xpath=//textarea[@name='description']
${REGISTER_PRODUCTS_IPT_QUATITY}      xpath=//input[@name="quantity"]
${UPLOAD_FILE}                        xpath=//input[@name='imagem']
${UPLOAD_PATH}                        ../ServeRest_Automation/download.png
${REGISTER_PRODUCTS_BT_REGISTER}      xpath=//button[@type='submit']
${PRODUCT_NAME}                       Notebook5
${QUANTITY}                           1
${PRICE}                              20
${PRODUCT_A_LIST}                     xpath=//a[contains(.,'Listar Produtos')]
${PRODUCT_H1_LIST}                    xpath=//h1[contains(.,'Lista dos Produtos')]


*** Keywords ***

Given i have logged in to the ServeRest page
    Then user enters the email "netoa@oi.com" and the password "1234"


When i click on the register button
    Click    ${HOME_BT_REGISTRATION}
    Wait For Elements State    ${HOME_BT_VERIFICATION}
    Take Screenshot

When i click on the product list
    Click    ${PRODUCT_A_LIST}
    Wait For Elements State    ${PRODUCT_H1_LIST}
    Take Screenshot
    
Then we remove the name from the "${NOME}" list
    Sleep    1
    Wait For Elements State    xpath=//tr[td[text()='${NOME}']]//button[text()='Excluir']
    ${SCROLL}=    Get Element    xpath=//tr[td[normalize-space(text())="${NOME}"] and td[text()="${PRICE}"] and td[text()="${QUANTITY}"]]
    Scroll To Element    ${SCROLL}
    Sleep    2
    Take Screenshot
    Click                      xpath=//tr[td[text()='${NOME}']]//button[contains(@class, 'btn-danger') and text()='Excluir']
    Sleep    1


And Fill in the product details
    Sleep    1
    Fill Text    ${REGISTER_PRODUCTS_IPT_NAME}              ${PRODUCT_NAME}
    Fill Text    ${REGISTER_PRODUCTS_IPT_PRICE}             ${PRICE}
                                                            ${RANDOM_COMMENT}=    Generate Random String    8    [LETTERS]
    Fill Text    ${REGISTER_PRODUCTS_IPT_DESCRIPTION}       ${RANDOM_COMMENT}
    Fill Text    ${REGISTER_PRODUCTS_IPT_QUATITY}           ${QUANTITY}
    Upload File By Selector    ${UPLOAD_FILE}               ${UPLOAD_PATH}
    Click    ${REGISTER_PRODUCTS_BT_REGISTER}


Then I validate the registration
    Sleep    1
    Wait For Elements State        xpath=//tr[td[normalize-space(text())="${PRODUCT_NAME}"] and td[text()="${PRICE}"] and td[text()="${QUANTITY}"]]
    ${SCROLL}=    Get Element    xpath=//tr[td[normalize-space(text())="${PRODUCT_NAME}"] and td[text()="${PRICE}"] and td[text()="${QUANTITY}"]]
    Scroll To Element    ${SCROLL}
    Sleep    1
    Take Screenshot



