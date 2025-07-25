*** Keywords ***
Open Shop
    Open Browser    ${URL}    ${BROWSER}    options=${OPTIONS}
    Maximize Browser Window
    Wait Until Element Is Visible    css:input.search-keyword

Search For Product
    [Arguments]    ${product}
    Clear Element Text    css:input.search-keyword
    Input Text    css:input.search-keyword    ${product}
    Sleep    2s

Add First Product To Cart
    Click Button    xpath://div[@class="product-action"]/button

Add Multiple Products To Cart
    Click Button    xpath:(//div[@class='product-action']/button)[1]
    Click Button    xpath:(//div[@class='product-action']/button)[2]

Go To Cart
    Click Element    css:img[alt='Cart']

Proceed To Checkout
    Click Button    xpath://button[text()='PROCEED TO CHECKOUT']
    Wait Until Element Is Visible    css:.promoCode

Place The Order
    Click Button    xpath://button[text()='Place Order']
    Wait Until Element Is Visible    css:select    timeout=10s
    Page Should Contain Element    css:select

