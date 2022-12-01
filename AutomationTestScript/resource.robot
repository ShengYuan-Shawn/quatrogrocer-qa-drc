*** Settings ***
Library          SeleniumLibrary
Documentation    QuatroGrocerFirstTest

*** Variables ***
${HomeURL}    https://www.quatrogrocer.one/

*** Keywords ***
Navigate To Google
    Open Browser    ${HomeURL}    chrome
    Maximize Browser Window

Verify Page Contains
    Title Should Be    QuatroGrocer Shopping App
    Wait Until Element Is Visible    //*[@class="home-header-content"]//button
    Click Element    //*[@class="home-header-content"]//button
    Wait Until Location Is    https://www.quatrogrocer.one/marketplace    20
    Page Should Contain Element    //div[@class="product-section-title"]//h5
    

Login Function
    
