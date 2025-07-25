*** Settings ***
Library           SeleniumLibrary
Resource    resources/keywords.robot
Resource    resources/variables.robot


*** Test Cases ***
Search And Buy Products
    Open Shop
    Search For Product    Tomato
    Add First Product To Cart

    Search For Product    Be
    Add Multiple Products To Cart

    Go To Cart
    Proceed To Checkout
    Place The Order
    Close Browser
