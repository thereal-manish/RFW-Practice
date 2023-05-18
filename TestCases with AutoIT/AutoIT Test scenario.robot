*** Settings ***
Library    AutoItLibrary
Library    SeleniumLibrary

*** Test Cases ***
Go to file upload form
    Open Browser    https://demo.automationtesting.in/FileUpload.html    Chrome
    Click Element    //input[@id='input-4']
    # Win Wait    File input - Multi select - Google Chrome
    # Control Click    