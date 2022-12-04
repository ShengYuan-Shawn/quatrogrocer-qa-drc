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
Open Application
    Open Browser    ${ApplicationURL}    ${Browser}
    Maximize Browser Window

Close Application
    Close Browser

Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE

Redirect Unregistered User To Login
#User click on 'add to cart' button
    Title Should Be    QuatroGrocer Shopping App
    Wait Until Element Is Visible    //*[@class="home-header"]    10
    Page Should Contain Element    //div[@class="today-top-deals-product"]    10
    Click Button    //button[@class="add-to-cart-btn"]
    

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

#Sign Up

Create Account
#User click on 'Create a new account' & redirect user to signup page
    Title Should Be    QuatroGrocer Shopping App
    Page Should Contain Element    //*[@class="login-container"]    5
    Wait Until Element Is Visible    //*[@class="login-container"]    5
    Click Element    //*[@class="signup-link"]
    Sleep     2

Verify Sign Up Page Contains     
    Page Should Contain Element    //div[@class="sign-up-container-content"]    5
    Wait Until Element Is Visible    //div[@class="sign-up-container-content"]    5

Enter First Name With Character Length more than equal to one

    
       


    
    



    # Click Element    //*[@type='password']
    # Press Keys    //*[@type='email']    CTRL+a+BACKSPACE
    # Input Text    //*[@type='password']    abc123456
    
    # Wait Until Element Is Visible    //button[@class='signup-login-btn']    10
    # Click Element    //button[@class='signup-login-btn']
    # Sleep    5




    # Click Element    //*[@type='email']
    # Press Keys    //*[@type='email']    CTRL+a+BACKSPACE    
    
    # Wait Until Element Is Visible    //button[@class='signup-login-btn']    10    
    # Element Should Be Disabled    //button[@class='signup-login-btn'] 
    # Sleep    5

