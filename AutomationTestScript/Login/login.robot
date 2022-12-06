*** Settings ***
Documentation      A Test Case For Ivalid And Valid Login
Resource           ../../Resources/loginResource.robot

# Execute Before Test Case
Test Setup         loginResource.Open Application
# Execute After Test Case
Test Teardown      loginResource.Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & Login Existing Account
    loginResource.Direct to Login Page
    loginResource.Verify Login Page
    loginResource.Verify Login Fail - Invalid Email Format
    loginResource.Verify Login Fail - Unregistered Email
    loginResource.Verify Login Fail - Wrong Password
    loginResource.Login With Registered Email And Password















