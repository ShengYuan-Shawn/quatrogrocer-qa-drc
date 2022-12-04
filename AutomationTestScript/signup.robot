*** Settings ***
Documentation      A test suite for valid login
Resource           ../Resources/resource.robot
# Execute Before Test Case
Test Setup         Open Application
# Execute After Test Case
Test Teardown      Close Application

*** Test Cases ***
Open QuatroGrocer & Verify QuatroGrocer Sign Up
    Redirect Unregistered User To Login
    Create Account
    Verify Sign Up Page Contains