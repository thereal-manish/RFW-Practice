*** Settings ***
Library    AutoItLibrary
Library    SeleniumLibrary

*** Variables ***
${url}        https://ps.uci.edu/~franklin/doc/file_upload.html
${button}    //input[@name='userfile']
${sendfile}    //input[@value='Send File']
*** Test Cases ***
Go to file upload form
    Open Browser    ${url}    Chrome
    ${text}    Get Text    css:body h1
    Log    ${text}
    Click Element    ${button}

    
    Win Wait    File input - Multi select - Google Chrome
    Click Element    ${sendfile}

    # Control Click    