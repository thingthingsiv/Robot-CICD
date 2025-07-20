*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Simple Web Test
    Open Browser    https://www.google.com    headlesschrome    
    ...    options=add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--user-data-dir=/tmp/chrome-profile-$$(date +%s)")
    Title Should Be    Google
    Close Browser