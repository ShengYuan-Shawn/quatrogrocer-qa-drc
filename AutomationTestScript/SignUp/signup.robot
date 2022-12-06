*** Settings ***
Documentation      A Test Case For Creating Quatro Grocer Account
Resource           ../../Resources/signupResource.robot

# Execute Before Test Case
Test Setup         signupResource.Open Application
# Execute After Test Case
Test Teardown      signupResource.Close Application

*** Test Cases ***
Open Quatro Grocer Shopping App & Create Quatro Grocer Account
    signupResource.Direct to Login Page
    signupResource.Direct to Sign Up Page
    signupResource.Verify Sign Up Page
    signupResource.Fill Up Sign Up Form