*** Settings ***
Documentation    First Test in mobile test automation
Library    AppiumLibrary

*** Variables ***
${serverAddress}    http://127.0.0.2:4733
${platformName}    Android
${deviceName}    OnePlus Nord CE 2 Lite 5G
${platformVersion}    12
${deviceUDID}    742d078a
${automationName}    uiautomator2
${browserName}    chrome       

*** Test Cases ***

Establish connection
         ${chrome_opt}    ChromeOptions dict
         Open Application    ${serverAddress}
        ...    platformName=${platformName} 
        ...    platformVersion=${platformVersion}
        ...    deviceName=${deviceName}
        ...    udid=${deviceUDID}
        ...    noReset=${True}
        ...    automationName=${automationName}
        ...    browserName=${browserName}
        # ...  appPackage=com.android.chrome
        # ...  appActivity=com.google.android.apps.chrome.Main
        ...    chromeOptions=${chrome_opt}
        log    ${chrome_opt}
        AppiumLibrary.Go To URL    https://m.uat1.onlinebrokerage.cibc.com/#/signon

*** Keywords ***
ChromeOptions dict
        @{args}    create list        enable-automation   
        &{dict}    create dictionary    excludeSwitches    ${args}
        [Return]    ${dict}










# Demo mobile automation

#     Wait Until Element Is Visible    ${Reg_click}
#     Click Element    ${Reg_click}

    

# User enters valid credentials to register
#     [Documentation]    Enter Valid Credential to Register
#     Input Text   ${Reg_Firstname}   ${Var_Firstname}
#     Input Text    ${Reg_lastname}    ${var_Lastname}
#     Input Text    ${Reg_username}   ${var_Username}
#     Input Password  ${Reg_password}      ${var_Password}

# Clicks the Register button
#     [Documentation]    Click register button
#     Click Element    ${Register_btn}

# User should be redirected to the Login page and enter valid credential to login
#     [Documentation]    Enter valid credential to Login
#     Input Text   ${Log_username}    ${var_Log_username}
#     Input Password    ${Log_password}    ${var_Log_password"}
#     Click Element    ${Login_btn}