*** Settings ***
Documentation      A Test Case For Directing To Categories
Resource           ../../Resources/directingToCategory.robot

# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & Create Quatro Grocer Account
    Direct To Marketplace Page