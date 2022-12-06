*** Settings ***
Documentation      This is a resource file that contain variables and keywords for writing test scripts.
...                Variables and keywords are defined here can be loaded in scenario based automation test.
Library            SeleniumLibrary

*** Variables ***
# Declaring Broswer
${Browser}    Chrome

# Declaring Application Details & URL
${ApplicationTitle}    QuatroGrocer Shopping App
${ApplicationURL}      https://www.quatrogrocer.one/
${LoginPageURL}        https://www.quatrogrocer.one/login
${SignUpPageURL}       https://www.quatrogrocer.one/signup

# Declaring Variables
${profileIcon}          //*[@data-testid='AccountCircleOutlinedIcon']
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${loginForm}            //div[@class='login-container-content']
${todayTopDealsForm}    //div[@class='today-top-deals']
${productCard}    //div[contains(@class,"vertical-card-container")]//*[text()='Mineral Water']
${loginButton}     //button[@class='login-btn']
${productDetailsContainer}    //div[contains(@class,"item-info-container")]//*[text()='Mineral Water']
*** Keywords ***
Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Title Should Be    ${ApplicationTitle}
    Maximize Browser Window

Close Application
    Close Browser

Direct to Login Page

    Wait Until Page Contains Element    ${todayTopDealsForm}    30
    Wait Until Element Is Visible    ${productCard}    30
    Click Element                       ${productCard}    
    Wait Until Location Is              ${LoginPageURL}    30


User Login
#User fill in email and password
    Wait Until Page Contains Element    ${loginForm}    30
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    junyuan99@gmail.com
    Click Element    ${inputPassword}
    Input Password    ${inputPassword}    Abc1234567890!
    Click Element    ${loginButton}    
    Wait Until Page Contains Element    ${productDetailsContainer}    10
    Sleep    2



