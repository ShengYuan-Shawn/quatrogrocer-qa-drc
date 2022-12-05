*** Settings ***
Documentation      A Test Case For Creating Quatro Grocer Account
Resource           ../../Resources/resource.robot

# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & Create Quatro Grocer Account
    Direct To Sign Up Page
    Fill Up Sign Up Form