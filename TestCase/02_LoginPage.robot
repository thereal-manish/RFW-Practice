*** Settings ***
Library    SeleniumLibrary    
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/Config.py
Variables    ../TestData/LoginPage.py
Variables    ../Locators/LoginLocators.py
Test Setup    Open Browser    ${url}         ${browserName}
Test Teardown  Close Browser  

*** Test Cases ***
Login page 
    Maximize Browser Window
    Sleep    3    
    Click Element    ${user_name}    
    Input Text    ${user_name}      ${UserNameVal}
    Input Password    ${password}       ${passwordval}
    Click Element     ${login_btn}    
    Wait Until Element Is Visible      ${homepage_element}        
    Capture Page Screenshot      C:/Users/SaravananNatarajan/RobotPractice/OrangeHRM/Result/screenshot.png