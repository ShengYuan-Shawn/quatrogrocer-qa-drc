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
${MarketplaceURL}      https://www.quatrogrocer.one/marketplace

# Declaring Categories Side Navigation Bar Variables
@{productCategories}=    Beverages    Bread & Pastry    Canned Food    Cereal    Confectionary    Condiments    Dairy    Fronzen Dairy    Fruits    Jam    Meat    Pet Food    Snacks    Tea, Coffee, Chocolate Drinks


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

Direct To Marketplace Page
    Wait Until Element Is Visible    //li[text()='Marketplace']
    Click Element    //li[text()='Marketplace']
    Wait Until Page Contains Element    //div[@class='side-nav']
    Wait Until Element Is Visible    //div[@class='side-nav']
    ${fuck}    Execute Javascript    return (Array.prototype.map.call(document.querySelelectorAll('div.category-list ul li'),z=>z.innerText))
    Should Be Empty    ${fuck}