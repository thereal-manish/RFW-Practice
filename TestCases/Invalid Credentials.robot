*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/RegisteraccVariables.py
Variables    ../TestData/InvalidAccData.py
Test Setup    Open Browser    ${url}    ${browser}    

*** Variables ***  
 

*** Test Cases ***
Invalid user data
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${invalidFirstName} 
   Input Text    ${txt_LastName}    ${invalidLastname}
   Input Text    ${txt_Email}     ${invalidEmail}
   Input Text    ${txt_mobile}    ${mobileNo}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${Wrongpassword}    
   Input Password    ${txt_Confirmpassword}    ${Wrongpassword}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   
