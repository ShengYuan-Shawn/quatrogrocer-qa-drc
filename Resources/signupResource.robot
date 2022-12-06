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
${inputCalendar}        //input[@type='tel']
${calendarIcon}         //*[@data-testid='CalendarIcon']
${calendarDatePage}     //*[@class='MuiCalendarPicker-root css-1brzq0m']
${calendarDropIcon}     //*[@data-testid="ArrowDropDownIcon"]//parent::button
${selectYear}           //div[contains(@class,'MuiYearPicker-root css-f09ynp')]//*[text()='2012']
${selectMonth}          //div[contains(@class,'MuiMonthPicker-root css-1616glu')]//*[text()='Jan']
${selectDate}           //div[contains(@class,'MuiCalendarPicker-root')]//button[text()=8]
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${maskedIcon}           //*[@class='MuiSvgIcon-root']
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
    Wait Until Page Contains Element    ${profileIcon}    40
    Wait Until Element Is Visible       ${profileIcon}    40
    Click Element                       ${profileIcon}
    Wait Until Location Is              ${LoginPageURL}    40
    
Direct to Sign Up Page
    Wait Until Page Contains Element    ${loginForm}    40
    Wait Until Element Is Visible       ${signUpLink}    40
    Click Element                       ${signUpLink}    
    Wait Until Location Is              ${SignUpPageURL}    40


Fill Up Sign Up Form
    Wait Until Page Contains Element    ${signUpForm}    40
    Wait Until Element Is Visible       ${signUpForm}    40
    Checkbox Should Not Be Selected     ${checkboxState}
    Element Should Be Disabled          ${signUpButton}
    
    # First Name Input
    Click Element    ${inputFirstName}    
    Input Text       ${inputFirstName}    Hassif-1mran
    
    # Last Name Input
    Click Element    ${inputLastName}
    Input Text       ${inputLastName}    Lim
    
    # Gender Input
    Click Element    ${inputGender}
    Wait Until Element Is Visible     ${genderList}    40
    FOR    ${gender}    IN    @{genderSelections}
        Page Should Contain Element    //li[@data-value='${gender}']
    END
    Click Element    ${selectMale}
    Wait Until Element Is Not Visible    ${genderList}    40
    
    # Calendar Input
    Click Element    ${calendarIcon}
    Wait Until Page Contains Element    ${calendarDatePage}    40
    Click Element    ${calendarDropIcon}
    Wait Until Page Contains Element    ${selectYear}    40
    Wait Until Element Is Visible    ${selectYear}    40
    Click Element    ${selectYear}
    Wait Until Page Contains Element    ${selectMonth}    40
    Wait Until Element Is Visible    ${selectMonth}    40
    Click Element    ${selectMonth}
    Wait Until Page Contains Element    ${selectDate}    40
    Wait Until Element Is Visible    ${selectDate}    40
    Click Element    ${selectDate}
    ${selectedDoB}=    Get Value    ${inputCalendar}  

    # Email Input
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    email
    
    # Password Input
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    password
    
    # Checked CHeckbox
    Click Element    ${tncCheckbox}
    Wait Until Page Contains Element    ${trueCheckbox}    40
    Element Should Be Enabled    ${signUpButton}

    Click Element    ${signUpButton}
    Wait Until Page Contains Element    ${errorMessage}    40
    ${getFirstErrorMessage}=    Get Text    ${errorMessage}
        
    # Re-type First Name
    Click Element    ${inputFirstName}    
    Clear Input Field    ${inputFirstName}    
    Input Text    ${inputFirstName}    Steven 

    Click Element    ${signUpButton}
    Sleep    1
    Wait Until Page Contains Element    ${errorMessage}    40
    ${getSecondErrorMessage}=    Get Text    ${errorMessage}

    # Check Error Message Value
    Should Not Be Equal As Strings    ${getFirstErrorMessage}    ${getSecondErrorMessage}
    
    # Re-type Password
    Click Element    ${inputPassword}
    Clear Input Field    ${inputPassword}
    Input Text    ${inputPassword}    password
    Click Element    ${maskedIcon}
    Click Element    ${maskedIcon}

    # Sign Up Account
    Click Element    ${signUpButton}
    Handle Alert    Accept
    
    # # Email Error
    # Wait Until Element Is Visible    css:input[type=email]:invalid
    # ${error}    Execute JavaScript    return ["missing an '@'","'.' is used at a wrong position in"].some(e=>document.querySelector('input[type=email]:invalid')?.validationMessage.includes(e))
    # Should Be True    ${error}