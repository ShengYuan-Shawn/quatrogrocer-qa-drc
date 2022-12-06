*** Settings ***
Documentation      A Test Case For Add Address
Resource           ../../Resources/addaddressResource.robot

# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & Add Address
    addaddressResource.Direct to Login Page
    addaddressResource.User Login
    addaddressResource.Direct User to Profile Page
    addaddressResource.Direct User to Shipping Address Page
    addaddressResource.Direct User to Add New Shipping Address Page
    addaddressResource.User Enter Address Line More than 50
    addaddressResource.User Enter Postcode With Characters
    addaddressResource.User Enter Invalid State
    addaddressResource.User Enter Valid Shipping Address
    