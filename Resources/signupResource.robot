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

# Declaring Create New Account Variables
@{genderSelections}=    male    female    others    
${profileIcon}          //*[@data-testid='AccountCircleOutlinedIcon']
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
${calendarIcon}         //*[@data-testid='CalendarIcon']
${calendarPage}         //*[@class='MuiCalendarPicker-root css-1brzq0m']
${aprilCalendar}        //div[contains(@class,'MuiCalendarPicker-root ')]//*[text()='April 2022']
${calendarDate}         //div[contains(@class,'MuiCalendarPicker-root')]//button[text()=8]
${leftArrowIcon}        //*[@data-testid='ArrowLeftIcon']                               
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${checkboxState}        //input[@type='checkbox']
${falseCheckbox}        //input[@type='checkbox' and @value='false']
${trueCheckbox}         //input[@type='checkbox' and @value='true']
${tncCheckbox}          //span[@class='checkmark']
${signUpButton}         //button[@class='signup-btn']
${errorMessage}         //p[@class='errmsg']

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys     ${inputField}    CTRL+a+BACKSPACE

Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Title Should Be    ${ApplicationTitle}
    Maximize Browser Window

Close Application
    Close Browser

Direct to Login Page
    Wait Until Page Contains Element    ${profileIcon}    30
    Wait Until Element Is Visible       ${profileIcon}    30
    Click Element                       ${profileIcon}
    Wait Until Location Is              ${LoginPageURL}    30
    
Direct to Sign Up Page
    Wait Until Page Contains Element    ${loginForm}    30
    Wait Until Element Is Visible       ${signUpLink}    30
    Click Element                       ${signUpLink}    
    Wait Until Location Is              ${SignUpPageURL}    30


Fill Up Sign Up Form
    Wait Until Page Contains Element    ${signUpForm}    30
    Wait Until Element Is Visible       ${signUpForm}    30
    Checkbox Should Not Be Selected     ${checkboxState}
    Element Should Be Disabled          ${signUpButton}
    
    Click Element    ${inputFirstName}    
    Input Text       ${inputFirstName}    Hassif-1mran
    
    Click Element    ${inputLastName}
    Input Text       ${inputLastName}    Lim

    Click Element    ${inputGender}
    Wait Until Element Is Visible     ${genderList}    30
    FOR    ${gender}    IN    @{genderSelections}
        Page Should Contain Element    //li[@data-value='${gender}']
    END
    Click Element    ${selectMale}
    Wait Until Element Is Not Visible    ${genderList}    30
    
    Click Element    ${calendarIcon}
    Wait Until Page Contains Element    ${calendarPage}    30
    Wait Until Element Is Visible    ${calendarPage}    30
    Wait Until Page Contains Element    ${leftArrowIcon}    30
    Wait Until Element Is Visible    ${leftArrowIcon}    30
    FOR    ${index}    IN RANGE    8
        Click Element    ${leftArrowIcon}
    END
    Wait Until Element Is Visible    ${aprilCalendar}    30
    Wait Until Page Contains Element    ${aprilCalendar}    30
    Click Element    ${calendarDate} 

    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    jonyj@gmail.com
    
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    Test1234

    Click Element    ${tncCheckbox}
    Wait Until Page Contains Element    ${trueCheckbox}
    Element Should Be Enabled    ${signUpButton}

# Hanle Alert    Accept
#     Click Element    ${signUpButton}
#     Wait Until Element Is Visible    css:input[type=email]:invalid
#     ${error}    Execute JavaScript    return ["missing an '@'","'.' is used at a wrong position in"].some(e=>document.querySelector('input[type=email]:invalid')?.validationMessage.includes(e))
#     Should Be True    ${error}