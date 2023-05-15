*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/InvalidEmail.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown     Close Browser

*** Variables ***  
 

*** Test Cases ***
Invalid Email
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${Email_name}
   Input Text    ${txt_Email}     ${Invalid_Email}
   Input Text    ${txt_mobile}    ${Email_mob}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${Email_password}    
   Input Password    ${txt_Confirmpassword}    ${Email_password}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   Wait Until Page Contains    *Enter Valid Email   
   Capture Page Screenshot        C:/Users/DhineshlingamNataraj/eclipse-workspace/Ecommerce/Result/Screenshot.png

