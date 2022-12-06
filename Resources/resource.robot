*** Settings ***
Documentation      This is a resource file that contain variables and keywords for writing test scripts.
...                Variables and keywords are defined here can be loaded in scenario based automation test.
Library            SeleniumLibrary

*** Variables ***
# Declaring Broswer
${Browser}    Chrome

# Declaring Application URL
${ApplicationURL}    http://localhost:3000/

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys     ${inputField}    CTRL+a+BACKSPACE

Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    # Title Should Be    ${ApplicationTitle}
    Maximize Browser Window

Close Application
    Close Browser

Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE

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
    

Verify Page Contains
    Title Should Be    QuatroGrocer Shopping App
    Wait Until Element Is Visible    //*[@class="home-header-content"]//button
    Click Element    //*[@class="home-header-content"]//button
    Wait Until Location Is    https://www.quatrogrocer.one/marketplace
    Page Should Contain Element    //div[@class="product-section-title"]//h5

Verify Login Page Contains
    Title Should Be    QuatroGrocer Shopping App
    Wait Until Element Is Visible    //*[@class="login-container"]    10

User Enter Unregistered Email Address
#User enter email does not exist
    Wait Until Page Contains Element    //*[@class="MuiInputBase-input MuiInput-input"]    10
    Input Text    //*[@type='email']    testing123@gmail.com
    Wait Until Page Contains Element    //*[@class="MuiInputBase-input MuiInput-input MuiInputBase-inputAdornedEnd"]    10
    Input Text    //input[@type='password']  Abc123456!
    Wait Until Element Is Visible    //button[@class='signup-login-btn']    10
    Click Element    //button[@class='signup-login-btn']

User Enter Invalid Email Address
#User enter email without '@'
    Click Element    //*[@type='email']
    Press Keys    //*[@type='email']    CTRL+a+BACKSPACE   
    Input Text    //*[@type='email']    randomusergmail.com
    Wait Until Page Contains Element    //*[@class="MuiInputBase-input MuiInput-input MuiInputBase-inputAdornedEnd"]    10
    Input Text    //input[@type='password']  Abc123456!
    Wait Until Element Is Visible    //button[@class='signup-login-btn']    10
    Click Element    //button[@class='signup-login-btn']

User Enter Incorrect Email Address
#User enter email with wrong position of '.'    
    Click Element    //*[@type='email']
    Press Keys    //*[@type='email']    CTRL+a+BACKSPACE
    Input Text    //*[@type='email']    randomuser@.com
    Wait Until Element Is Visible    //button[@class='signup-login-btn']    10
    Click Element    //button[@class='signup-login-btn']

 User Mask & Unmask Password   
    Click Element    //*[@class="MuiSvgIcon-root"] 
    Click Element    //*[@class="MuiSvgIcon-root"]

 User Leave Input Field Blank
    Click Element    //*[@type='email']
    Press Keys    //*[@type='email']    CTRL+a+BACKSPACE
    Click Element    //*[@type='password']
    Press Keys    //*[@type='password']    CTRL+a+BACKSPACE
    Element Should Be Disabled    //button[@class='signup-login-btn']     

 User Enter Valid Email Address & Incorrect Password    
    Click Element    //*[@type='email']
    Press Keys    //*[@type='email']    CTRL+a+BACKSPACE
    Input Text    //*[@type='email']    randomuser@gmail.com
    Click Element    //*[@type='password']
    Press Keys    //*[@type='password']    CTRL+a+BACKSPACE
    Input Text    //*[@type='password']    abc123456
    Click Element    //button[@class='signup-login-btn']   

User Enter Valid Email Address & Correct Password
    Click Element    //*[@type='password']
    Press Keys    //*[@type='password']    CTRL+a+BACKSPACE
    Input Text    //*[@type='password']    Abc123456!
    Click Element    //button[@class='signup-login-btn'] 
    Sleep    2



    Click Element    ${signUpButton}