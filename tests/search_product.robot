*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://rahulshettyacademy.com/seleniumPractise/#/
${BROWSER}    Chrome
${ITEM}       Brocolli

*** Test Cases ***
Search for a Product and Add to Cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    css:input.search-keyword    ${ITEM}
    Sleep    1s

    Click Element    xpath://button[text()='ADD TO CART']
    Sleep    1s

    Click Element    css:img[alt='Cart']
    Click Element    xpath://button[text()='PROCEED TO CHECKOUT']
    
    Page Should Contain Element    css:.product-name  # checks if product is in cart

    Close Browser
