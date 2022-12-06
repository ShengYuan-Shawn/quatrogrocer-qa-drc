*** Settings ***
Documentation        Test script for login
Resource             ../Resources/resource.robot

Suite Setup    Open Application
Suite Teardown    Close Application
Test Template    Invalid Login Scenario

*** Test Cases ***