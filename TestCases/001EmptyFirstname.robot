*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/EmptyFirstname.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown     Close Browser

*** Variables ***  
 

*** Test Cases ***
Empty Firstname 
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${EmptyFirstName}
   Input Text    ${txt_LastName}    ${invalidLastname}
   Input Text    ${txt_Email}     ${Emp_Firstname_Email}
   Input Text    ${txt_mobile}    ${Emp_mob}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${Wrongpassword}    
   Input Password    ${txt_Confirmpassword}    ${Wrongpassword}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   Wait Until Page Contains    *First Name is required
    Capture Page Screenshot        C:/Users/DhineshlingamNataraj/eclipse-workspace/Ecommerce/Result/Screenshot.png
    

