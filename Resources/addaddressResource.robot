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

#Declaring Variables
${profileIcon}          //*[@data-testid='AccountCircleOutlinedIcon']
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${loginForm}            //div[@class='login-container-content']
${loginButton}         //button[@class='login-btn']
${profilePageContainer}    //div[@class='profile-page-container']
${accountDetailsContainer}    //div[@class='account-details-container']
${addressPageContainer}       //div[@class='address-page-container']
${addAddressButton}           //button[@class='add-address-btn'] 
${addAddressPageContainer}    //div[@class='add-address-page-container']
${addressLine1InputField}    //div[contains(@class, 'address-line-1')]//input[@type='text']
${addressLine2InputField}    //div[contains(@class, 'address-line-2')]//input[@type='text']
${addressLine3InputField}    //div[contains(@class, 'address-line-3')]//input[@type='text'] 
${postCodeInputField}        //div[contains(@class, 'postcode')]//input[@type='text']
${stateInputField}           //div[contains(@class,'MuiInputBase-root MuiInput-root state-input')]//input 
${addAddressButton1}        //button[@class='add-address-btn']
*** Keywords ***
Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Title Should Be    ${ApplicationTitle}
    Maximize Browser Window

Close Application
    Close Browser

Direct to Login Page
    Wait Until Page Contains Element    ${profileIcon}    30
    Click Element    ${profileIcon}

User Login
    Wait Until Page Contains Element    ${loginForm}    30
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    junyuan99@gmail.com
    Click Element    ${inputPassword}
    Input Password    ${inputPassword}    Abc1234567890!
    Click Element    ${loginButton}

Direct User to Profile Page        
    Wait Until Page Contains Element    ${profileIcon}    10
    Click Element    ${profileIcon}
Direct User to Shipping Address Page
    Wait Until Page Contains Element    ${profilePageContainer}    10
    Wait Until Element Is Visible    ${accountDetailsContainer}    10
    Wait Until Element Is Visible    //*[@class='view-address-link']    10
    Click Element    //*[@class='view-address-link']   

Direct User to Add New Shipping Address Page
    Wait Until Page Contains Element    ${addressPageContainer}    10
    Click Element    ${addAddressButton}

User Enter Address Line More than 50
    Wait Until Page Contains Element    ${addAddressPageContainer}
    Click Element    ${addressLine1InputField}
    Input Text    ${addressLine1InputField}    No.82ufhdjfnvkdsmvdsmvkmdsvksmvslvmslkvmlfskmvomvkmf2323232fsvfnvjfnvkfsmvkfslmvlsmvmsmvkfsmvkfmsvlmfsv
    Click Element    ${addressLine2InputField}
    Input Text    ${addressLine2InputField}    Jalan Warisan Mulia
    Click Element    ${addressLine2InputField}
    Input Text    ${addressLine3InputField}    4/3
    Click Element    ${postCodeInputField}
    Input Text    ${postCodeInputField}    43900 
    Click Element   ${stateInputField}    
    Input Text    ${stateInputField}    Selangor
    Click Element    ${addAddressButton1}

User Enter Postcode With Characters
    Click Element    ${addressLine1InputField} 
    Press Keys    ${addressLine1InputField}    CTRL+a+BACKSPACE
    Input Text    ${addressLine1InputField}    No.8    
    Click Element    ${postCodeInputField}
    Press Keys   ${postCodeInputField}    CTRL+a+BACKSPACE 
    Input Text    ${postCodeInputField}    four thousands
    Click Element    ${addAddressButton1}

User Enter Invalid State
    Click Element    ${postCodeInputField}
    Press Keys   ${postCodeInputField}    CTRL+a+BACKSPACE
    Input Text    ${postCodeInputField}    43900
    Click Element    ${stateInputField} 
    Press Keys   ${stateInputField}    CTRL+a+BACKSPACE
    Input Text    ${stateInputField}    London   
    Click Element    ${addAddressButton1}

User Enter Valid Shipping Address
    Click Element    ${stateInputField}
    Press Keys   ${stateInputField}    CTRL+a+BACKSPACE
    Input Text    ${stateInputField}    Selangor
    Click Element    ${addAddressButton1}
    Sleep    2


        



    


