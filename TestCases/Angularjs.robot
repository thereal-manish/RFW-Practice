*** Settings ***
Documentation    Angular and BDD practice
Library         SeleniumLibrary
Library         AngularJSLibrary
Library    OperatingSystem
Variables    ../Locators/angularLocator.yaml
Variables    ../TestData/AngularVariables.yaml

*** Test Cases ***
Create new user
    [Documentation]    using Bdd Framework
    Given user is on login page and Navigate to Register page
    When User enters valid credentials to register
    And Clicks the Register button
    Then User should be redirected to the Login page and enter valid credential to login

*** Keywords ***
user is on login page and Navigate to Register page
    [Documentation]    User navigate to register page
    Open Browser    ${url}    ${browser}
    Click Element    ${Reg_click}

User enters valid credentials to register
    [Documentation]    Enter Valid Credential to Register
    Input Text   ${Reg_Firstname}   ${Var_Firstname}
    Input Text    ${Reg_lastname}    ${var_Lastname}
    Input Text    ${Reg_username}   ${var_Username}
    Input Password  ${Reg_password}      ${var_Password}

Clicks the Register button
    [Documentation]    Click register button
    Execute Javascript    ${Register_btn}

User should be redirected to the Login page and enter valid credential to login
    [Documentation]    Enter valid credential to Login
    Input Text   ${Log_username}    ${var_Log_username}
    Input Password    ${Log_password}    ${var_Log_password"}
    Execute Javascript    ${Login_btn}