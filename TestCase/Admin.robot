*** Settings ***
Documentation    This file is for registering account
Library    SeleniumLibrary
Library    FakerLibrary
# have to install seleniumScreenshots
Library    Screenshot
Variables    ../TestData/Admin.py
Variables    ../TestData/invalid admin.py
Variables    ../config/config.py
variables    ../locators/loginpag.py   

Test Setup    Open Browser    ${url}    ${browserName}   
Test Teardown    Close Browser


*** Test Cases ***
invalid credentails
    Maximize Browser Window
    Click Element    ${txt_Email}    
    Clear Element Text    ${txt_Email}
    Sleep    5  
    Input Text        ${txt_Email}    ${inEmail} 
    Click Element    ${txt_Password}    
    Clear Element Text    ${txt_password} 
    sleep    5    
    Input Text    ${txt_password}    ${inpassword}    
    Click Element    ${cb_remainder}    
    Click Button    ${btn_Login}  


Log into the admin nopcommerce application
    
    Maximize Browser Window
    Click Element    ${txt_Email}    
    Clear Element Text    ${txt_Email}
    Sleep    5  
    Input Text        ${txt_Email}    ${Email} 
    Click Element    ${txt_Password}    
    Clear Element Text    ${txt_password} 
    sleep    5    
    Input Text    ${txt_password}    ${password}    
    Click Element    ${cb_remainder}    
    Click Button    ${btn_Login}    
    