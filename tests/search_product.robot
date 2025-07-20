*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Simple Web Test
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --user-data-dir=/tmp/chrome-profile-${random.randint(1000,9999)}
    Open Browser    https://www.google.com    chrome    options=${options}
    Title Should Be    Google
    Close Browser
