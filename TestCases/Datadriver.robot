*** Settings ***
Documentation    Datadriver
Library   SeleniumLibrary
Library   DataDriver    file=C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/TestCases/excelutil.xlsx  sheet_name=Registration    
Variables    ../Locators/RegAccLocators.yaml
Test Setup    Open Browser    https://www.saucedemo.com/    chrome
Task Template    Login With User And Password
Test Teardown    Close Browser
*** Variables ***
${username}
${password}
*** Test Cases ***     
Login with user ${username} and password ${password}   
*** Keywords ***
Login With User And Password
    [Arguments]    ${Username}    ${Password}
    Input Text    ${UsernameTXt}    ${username}
    Input Password    ${passwordTXT}    ${password}
    Click Button    ${loginbtn}
    