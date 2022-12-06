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
${ProfilePageURL}      https://www.quatrogrocer.one/profile
${MarketplaceURL}      https://www.quatrogrocer.one/marketplace
${AddAddressURL}       https://www.quatrogrocer.one/add-address

# Declaring Login New Account Variables
${profileIcon}          //*[@data-testid='AccountCircleOutlinedIcon']
${loginForm}            //div[@class='login-container-content']
${inputEmail}           //input[@type='email']
${inputPassword}        //input[@type='password']
${loginButton}          //button[@class='login-btn']

# Declaring New User Account Variables
${profileContent}       //div[@class='profile-page-container']

# Declaring Navigation Links Variables
${marketplaceNav}       //div[@class='nav-left']//li[text()='Marketplace']

# Declaring Marketplace Variables
${marketplaceContent}    //div[@class='product-page']
${sideNav}               //div[@class='side-nav']
${carouselSlide}         //div[@class='carousel']
${productPagination}     //div[@class='filter-info']
${selectedProduct}       //div[@class='medium-horizontal-card']//*[text()='My Mochi Ice Cream Cookies & Cream 6s 180g']

# Declaring Purchasing Value
${productContent}        //div[@class='above-container']
${minusIcon}             //*[@data-testid='IndeterminateCheckBoxOutlinedIcon']
${addIcon}               //*[@data-testid='AddBoxOutlinedIcon']
${addToCartButton}       //button[@class="add-to-cart"]

# Declaring Adding New Address Details Variables
${bagIcon}                  //*[@data-testid='ShoppingBagOutlinedIcon']
${addShippingAddContent}    //div[@class='add-address-page-container']
${addAddressform}           //div[@class='address-form-container']
${addressLine1Input}        //div[contains(@class, 'address-line-1')]//input[@type='text']
${addressLine2Input}        //div[contains(@class, 'address-line-2')]//input[@type='text']
${addressLine3Input}        //div[contains(@class, 'address-line-3')]//input[@type='text']
${postcodeInput}            //div[contains(@class, 'postcode')]//input[@type='text']
${stateInput}               //div[contains(@class,'MuiInputBase-root MuiInput-root state-input')]//input
${addAddressButton}         //button[@class='add-address-btn']

# Declaring Checkout Variables
${shipmentDetails}        //div[@class='shipping-payment-content-container']
${orderDetails}           //div[@class='order-summary-container']
${addressDropdown}        //div[@id='demo-simple-select']
${addressSelection}       //*[@data-value='33']
${placeOrderButton}       //button[@type='submit']

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

Verify Login Page
    Wait Until Location Is              ${LoginPageURL}    40
    Page Should Contain Element         ${loginForm}    
    Wait Until Page Contains Element    ${loginForm}    40
    Wait Until Element Is Visible       ${loginForm}    40
    Element Should Be Disabled          ${loginButton}

Login With Registered Email And Password
    Click Element    ${inputEmail}
    Input Text    ${inputEmail}    shengyuan@email.com
    Click Element    ${inputPassword}
    Input Text    ${inputPassword}    Test@1234
    # Login Account
    Element Should Be Enabled    ${loginButton}
    Click Element    ${loginButton}
    Wait Until Location Is Not    ${LoginPageURL}
    Wait Until Location Is    ${ProfilePageURL}

Verify Profile Page
    Wait Until Page Contains Element    ${profileContent}    40
    Page Should Contain Element    ${profileContent}    
    Wait Until Element Is Visible    ${profileContent}    40

Go To Marketplace
    Wait Until Element Is Visible    ${marketplaceNav}    40
    Click Element    ${marketplaceNav}
    Location Should Be    ${MarketplaceURL}
    Wait Until Page Contains Element    ${marketplaceContent}    40
    Page Should Contain Element     ${marketplaceContent}
    Wait Until Element Is Visible    ${marketplaceContent}    40
    Element Should Be Visible    ${sideNav}
    Element Should Be Visible    ${carouselSlide}
    Element Should Be Visible    ${productPagination}

# Select Product
#     Element Should Be Visible    ${selectedProduct} 
#     Click Element    ${selectedProduct} 
     
# Verify Product And Add To Cart
#     Wait Until Page Contains Element    ${productContent}    40
#     Page Should Contain Element    ${productContent}    
#     Wait Until Element Is Visible    ${productContent}    40
#     Click Element    ${addIcon}
#     Click Element    ${addIcon}
#     Sleep    1
#     Click Element    ${minusIcon}
#     Click Element    ${addToCartButton}

Go To Checkout Cart
    Click Element    ${bagIcon}
    Sleep    1

# Redirect To Add Address Page
#     Location Should Be    ${AddAddressURL}
#     Wait Until Page Contains Element    ${addShippingAddContent}    40
#     Page Should Contain Element    ${addShippingAddContent}    
#     Wait Until Element Is Visible    ${addShippingAddContent}    40
    
# Adding New Address
#     Page Should Contain Element    ${addAddressform}    
#     Element Should Be Disabled    ${addAddressButton}

#     Click Element    ${addressLine1Input}
#     Input Text    ${addressLine1Input}    30, Jalan Burung Helang 
    
#     Click Element    ${addressLine2Input}
#     Input Text    ${addressLine2Input}    Taman Kepong Baru

#     Click Element    ${addressLine3Input}
#     Input Text    ${addressLine3Input}    Kepong

#     Click Element    ${postcodeInput}
#     Input Text    ${postcodeInput}    54220

#     Click Element    ${stateInput}
#     Input Text    ${stateInput}    Kuala Lumpur

#     Click Element    ${addAddressButton}
#     Handle Alert    Accept

Product Checkout
    Element Should Be Disabled    ${placeOrderButton}

    Wait Until Page Contains Element    ${shipmentDetails}    40
    Page Should Contain Element    ${shipmentDetails}    
    Wait Until Element Is Visible    ${shipmentDetails}    40

    Wait Until Page Contains Element    ${orderDetails}    40
    Page Should Contain Element    ${orderDetails}    
    Wait Until Element Is Visible    ${orderDetails}    40

    Click Element    ${addressDropdown}
    Wait Until Element Is Visible    ${addressSelection}    40
    Click Element    ${addressSelection}
    
    Element Should Be Enabled    ${placeOrderButton}

    Execute Javascript
    Click Element    ${placeOrderButton}

Redirect To Payment Success Page