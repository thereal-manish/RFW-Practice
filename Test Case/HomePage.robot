*** Settings ***
Documentation    doc
Library    SeleniumLibrary    
Library    FakerLibrary
Library    Screenshot         
Variables    ../Locator/HomePage.py
Variables    ../Test Data/HomePage.py
Variables     ../Locator/Practice page.py
Variables    ../Test Data/Practice.py   
Variables    ../Test Data/Config.py
# Test Teardown    Open Browser    ${url}    Chrome        
*** Test Cases ***
Home Page   
    # Click Button    Confirm  practice  
    Open Browser    ${url}    Chrome
    Maximize Browser Window    
    Click Element   ${radio}   
    Input Text   ${countries}    united kingdom
    # Select From List By Index    //select[@id='dropdown-class-example']         
    Select From List By Index    ${dropdown}    ${Index}
    Click Element    ${checkbox}
    Click Link    ${SwitchToAnotherTab}
    Sleep    6    
    # for going to new tab we will be using this
    Select Window    NEW
    # if we want to move to previous tab we should use this
    Select Window    MAIN     
    Input Text    ${alert}    ${AlertText} 
    Sleep    3                 
    Click Button    ${Alert2}
    # to handle the alert 
    Handle Alert    ACCEPT 
         
    Input Text    ${alert}    ${ConfirmText}
    Click Button    ${ConfirmAlert}   
    # Locator: value="Confirm"
    #TO Cancel in the alert window 
    Sleep    3 
    Handle Alert    DISMISS 
    Scroll Element Into View    ${scroll} 
    Scroll Element Into View    //button[@id='mousehover']   
    Mouse Over    ${mouseOver} 
    Scroll Element Into View    ${HomePage}
    Click Element    ${HomePage}    
    Wait Until Page Contains     Learn Earn & Shine 
    Click Link    ${Register}
    Click Button    ${SignUpWithMail}  
    Click Link    ${AlreadyHaveTheAccount}
    Sleep    3    
    Click Link    ${ForgotPassword}    
    Input Text    ${email}    ${emailtext} 
    Click Element    ${next}
    Select Window    NEW
    Capture Page Screenshot    C:/Users/SujanKumar/eclipse-workspace/Kumaran/Results/Screenshot.png   