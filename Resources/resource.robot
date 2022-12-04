*** Settings ***
Documentation      This is a resource file that contain variables and keywords for writing test scripts.
...                Variables and keywords are defined here can be loaded in scenario based automation test.
Library            SeleniumLibrary

*** Variables ***
# Declaring Broswer
${Browser}    Chrome

# Declaring Application Details & URL
${ApplicationTitle}    QuatroGrocer Shopping App
${ApplicationURL}      http://localhost:3000/
${LoginPageURL}        http://localhost:3000/login
${SignUpPageURL}       http://localhost:3000/signup

# Declaring Create New Account Variables
@{genderSelections}=    male    female    others    
${profileIcon}          //*[@data-testid="AccountCircleOutlinedIcon"]
${loginForm}            //div[@class='login-container-content']
${signUpLink}           //a[@class="signup-link"]
${signUpForm}           //div[@class='sign-up-container-content'] 
${inputFirstName}       //input[@type='first-name']
${inputLastName}        //input[@type='last-name']
${inputGender}          //div[@id='gender-dropdown-menu']
${genderList}           //ul[@aria-labelledby='gender-dropdown-list']
${selectMale}           //li[@data-value='male']
${selectFemale}         //li[@data-value='female']
${selectOthers}         //li[@data-value='others']
${inputDoB}             //input[@id=':r1:']
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${tncCheckbox}          //span[@class='checkmark']
${signUpButton}         //button[@class='signup-btn']

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys     ${inputField}    CTRL+a+BACKSPACE

Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Title Should Be    ${ApplicationTitle}
    Maximize Browser Window
    Sleep    1
    
Close Application
    Close Browser

Direct To Sign Up Page
    Wait Until Page Contains Element    ${profileIcon}    20
    Wait Until Element Is Visible    ${profileIcon}    20
    Click Element    ${profileIcon}

    Wait Until Location Is    ${LoginPageURL}    20
    Wait Until Page Contains Element    ${loginForm}    20
    Wait Until Element Is Visible    ${signUpLink}    20
    Click Element    ${signUpLink}

    Wait Until Location Is    ${SignUpPageURL}    20
    Wait Until Page Contains Element    ${signUpForm}    20
    Wait Until Element Is Visible    ${signUpForm}    20
    Element Should Be Disabled    ${signUpButton}

Fill Up Sign Up Form
    Click Element    ${inputFirstName}
    Input Text    ${inputFirstName}    John

    Click Element    ${inputLastName}
    Input Text    ${inputLastName}    Doe

    Click Element    ${inputGender}
    Wait Until Element Is Visible    ${genderList}    20
    # For Loop to Verify Gender Value
    FOR    ${gender}    IN    @{genderSelections}
        Page Should Contain Element    //li[@data-value='${gender}']
    END
    Click Element    ${selectMale}

    Click Element    ${inputDoB}
    Input Text    ${inputDoB}    04112000

    Click Element    ${inputEmail}
    # Input Text    ${inputEmail}    

    Click Element    ${inputPassword}
    # Input Text    ${inputPassword}    
    
    Click Element    ${tncCheckbox}
    Element Should Be Enabled    ${signUpButton}
    Click Element    ${tncCheckbox}
    Element Should Be Disabled    ${signUpButton}
    Click Element    ${tncCheckbox}
    Element Should Be Enabled    ${signUpButton}

    Click Element    ${signUpButton}