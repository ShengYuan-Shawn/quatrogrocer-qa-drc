*** Settings ***
Library          SeleniumLibrary
Documentation    QuatroGrocerFirstTest
Resource    ./resource.robot

*** Test Cases ***
Open QuatroGrocer & Verify QuatroGrocer
    Navigate To Google
    Verify Page Contains