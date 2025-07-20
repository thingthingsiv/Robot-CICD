*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Simple Web Test
    Open Browser    https://www.google.com    headlesschrome
    Title Should Be    Google
    Close Browser