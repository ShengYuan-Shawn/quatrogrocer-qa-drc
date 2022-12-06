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
${ProfilePageURL}      https://www.quatrogrocer.one/profile

# Declaring Login Account Variables
${profileIcon}          //*[@data-testid='AccountCircleOutlinedIcon']
${loginForm}            //div[@class='login-container-content']
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${maskedIcon}           //*[@class='MuiSvgIcon-root']
${unmaskedPassword}     //input[@type='text' and @placeholder='Password']
${errorMessage}         //p[@class='errmsg']
${loginButton}          //button[@class='login-btn']

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys     ${inputField}    CTRL+a+BACKSPACE

Clear Login Form
    Click Element    ${inputEmail}
    Clear Input Field    ${inputEmail}
    Click Element    ${inputPassword}
    Clear Input Field    ${inputPassword}
    Element Should Be Disabled    ${loginButton}

Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Title Should Be    ${ApplicationTitle}
    Maximize Browser Window

Close Application
    Close Browser

Direct to Login Page
    Wait Until Page Contains Element    ${profileIcon}    40
    Wait Until Element Is Visible       ${profileIcon}    40
    Click Element                       ${profileIcon}    

Verify Login Page
    Wait Until Location Is              ${LoginPageURL}    40
    Page Should Contain Element         ${loginForm}    
    Wait Until Page Contains Element    ${loginForm}    40
    Wait Until Element Is Visible       ${loginForm}    40
    Element Should Be Disabled          ${loginButton}

Verify Login Fail - Invalid Email Format
    # First Invalid Email Format
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    email

    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    password

    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}

    Sleep    1

    Wait Until Element Is Visible    css:input[type=email]:invalid
    ${error}    Execute JavaScript    return ["missing an '@'","'.' is used at a wrong position in"].some(e=>document.querySelector('input[type=email]:invalid')?.validationMessage.includes(e))
    Should Be True    ${error}

    Click Element    ${inputEmail}
    Clear Input Field    ${inputEmail}
    # Second Invalid Email Format
    Input Text    ${inputEmail}    email

    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}

    Sleep    1

    Wait Until Element Is Visible    css:input[type=email]:invalid
    ${error}    Execute JavaScript    return ["missing an '@'","'.' is used at a wrong position in"].some(e=>document.querySelector('input[type=email]:invalid')?.validationMessage.includes(e))
    Should Be True    ${error}

    Clear Login Form

Verify Login Fail - Unregistered Email
    # Unregistered Email 
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    email
    
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    password

    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}
    Sleep    1
    Wait Until Page Contains Element    ${errorMessage}    40
    Wait Until Element Is Visible    ${errorMessage}    40
    Element Should Be Visible    ${errorMessage}    40
    ${nonExistEmailErrorMessage}=    Get Text    ${errorMessage}
    
    Clear Login Form

Verify Login Fail - Wrong Password
    # Registered Email 
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    email
    # Wrong Password
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    password

    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}
    Sleep    1
    Wait Until Page Contains Element    ${errorMessage}    40
    Wait Until Element Is Visible    ${errorMessage}    40
    Element Should Be Visible    ${errorMessage}    40
    ${nonExistEmailErrorMessage}=    Get Text    ${errorMessage}
    
    Clear Login Form

Login With Registered Email And Password
    # Registered Email 
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    email
    # Registered Password
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    password
    Click Element    ${maskedIcon}
    Page Should Contain Element    ${unmaskedPassword}
    Click Element    ${maskedIcon}

    # Login Account
    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}
    
    Wait Until Location Is Not    ${LoginPageURL}
    Wait Until Location Is    ${ProfilePageURL}