*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/Invalidpass.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown     Close Browser

*** Variables ***  
 

*** Test Cases ***
Invalid Password
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${pass_name}
   Input Text    ${txt_Email}     ${pass_Email}
   Input Text    ${txt_mobile}    ${pass_mob}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${pass_password}    
   Input Password    ${txt_Confirmpassword}    ${pass_password}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   Wait Until Page Contains   *Password is required 
   Capture Page Screenshot        C:/Users/DhineshlingamNataraj/eclipse-workspace/Ecommerce/Result/Screenshot.png

