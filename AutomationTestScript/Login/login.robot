*** Settings ***
Documentation      A test suite for valid login
Resource           ../../Resources/loginResource.robot
# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open QuatroGrocer & Verify QuatroGrocer Login
    Redirect Unregistered User To Login
    Verify Login Page Contains
    User Enter Unregistered Email Address
    User Enter Invalid Email Address
    User Enter Incorrect Email Address
    User Mask & Unmask Password
    User Leave Input Field Blank
    User Enter Valid Email Address & Incorrect Password
    User Enter Valid Email Address & Correct Password
    
    
