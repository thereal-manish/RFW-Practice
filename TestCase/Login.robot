*** Settings ***
Documentation   To validate the Login page
Library     SeleniumLibrary
Library     BuiltIn 
Library    Screenshot
Variables    ../TestData/config.py
Variables    ../TestData/login.py
Variables    ../Locators/loginPage.py
Variables    ../TestData/invalidLogin.py
Test Setup    Open Browser    ${url}    ${browserName}
Test Teardown    Close All Browsers


*** Test Cases ***
Null Username and Null Password 
    Maximize Browser Window
    Wait Until Page Contains    ${page_text}  
    Click Button                ${login_btn}
    Page Should Contain         ${emptyErrorMsg} 
    
Null Username and validpassword
    Maximize Browser Window
    Wait Until Page Contains         ${page_text}  
    Input Text    ${user_password}   ${validPassword}
    Click Button                     ${login_btn}
    Page Should Contain              ${userError}
    
Valid Username and NullPassword
    Maximize Browser Window
    Wait Until Page Contains         ${page_text}  
    Input Text    ${user_name}       ${invalidUser}
    Click Button                     ${login_btn}
    Page Should Contain              ${passwordError}     
            
Invalid Username and Invalidpassword
    Maximize Browser Window
    Wait Until Page Contains         ${page_text}  
    Input Text    ${user_name}       ${invalidUser}
    Input Text    ${user_password}   ${invalidPassword}
    Click Button                     ${login_btn}
    Page Should Contain              ${invalidErrorMsg}    
    
Invalid Username and validpassword
    Maximize Browser Window
    Wait Until Page Contains           ${page_text}  
    Input Text      ${user_name}       ${invalidUser}
    Input Text      ${user_password}   ${validPassword}
    Click Button    ${login_btn}
    Page Should Contain                ${invalidErrorMsg}
    
Valid Username and Invalidpassword      
    Maximize Browser Window
    Wait Until Page Contains           ${page_text}  
    Input Text      ${user_name}       ${validUser}
    Input Text      ${user_password}   ${invalidPassword}
    Click Button    ${login_btn}
    Page Should Contain                ${invalidPasswordErrorMsg}        
    
Valid Username and Validpassword
    Maximize Browser Window
    Wait Until Page Contains           ${page_text}  
    Input Text      ${user_name}       ${validUser}
    Input Text      ${user_password}   ${validPassword}
    Click Button    ${login_btn}   
    Capture Page Screenshot    C:/Users/kumaran/eclipse-workspace/RedEditor/Sauce_Demo/Results/screenshot.png
      
    
