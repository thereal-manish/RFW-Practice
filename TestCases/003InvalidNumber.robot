*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/Phonenumber.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown     Close Browser


*** Test Cases ***
Invalid Phonenumber
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${mob_name}
   Input Text    ${txt_Email}     ${mob_Email}
   Input Text    ${txt_mobile}    ${mob_no}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${mob_password}    
   Input Password    ${txt_Confirmpassword}    ${mob_password}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   Wait Until Page Contains    *Phone Number must be 10 digit   
   Capture Page Screenshot        C:/Users/DhineshlingamNataraj/eclipse-workspace/Ecommerce/Result/Screenshot.png

