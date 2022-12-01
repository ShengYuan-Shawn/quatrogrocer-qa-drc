*** Settings ***
Documentation      This is a resource file that contain variables and keywords for writing test scripts.
...                Variables and keywords are defined here can be loaded in scenario based automation test.
Library            SeleniumLibrary

*** Variables ***
# Declaring Broswer
${Browser}    Chrome

# Declaring Application URL
${ApplicationURL}    https://www.quatrogrocer.one/

*** Keywords ***
Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Maximize Browser Window
    
Close Application
    Close Browser

Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE

Verify Page Contains
    Title Should Be    QuatroGrocer Shopping App
    Wait Until Element Is Visible    //*[@class="home-header-content"]//button
    Click Element    //*[@class="home-header-content"]//button
    Wait Until Location Is    https://www.quatrogrocer.one/marketplace
    Page Should Contain Element    //div[@class="product-section-title"]//h5