*** Settings ***
Documentation      A Test Case For View Product
Resource           ../../Resources/viewproductResource.robot

# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & View Product
    viewproductResource.Direct to Login Page
    viewproductResource.User Login
    