*** Settings ***
Documentation     Click Register here button
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/config.py
Variables    ../Locators/RegAccLocators.py
Variables    ../TestData/RegisteraccVariables.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown    Close Browser
*** Variables ***  
${Email}      
${password}   

*** Test Cases ***
Create new account
    
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
           
   Set Global Variable    ${Email} 
   Set Global Variable    ${password}  
   ${Firstname}    FakerLibrary.First Name Male
   ${Lastname}    FakerLibrary.Last Name
   ${Email}    FakerLibrary.Email    
   ${password}    FakerLibrary.Password    
   Input Text    ${txt_FirstName}    ${Firstname} 
   Input Text    ${txt_LastName}    ${Lastname}
   Input Text    ${txt_Email}     ${Email} 
   Input Text    ${txt_mobile}    ${mobileNo}
   Wait Until Element Is Visible    ${dropdown_btn}    
   Select From List By Label   ${dropdown_btn}    Doctor       
   Click Element    ${btn_Radio}
   Input Password    ${txt_password}    ${password}    
   Input Password    ${txt_Confirmpassword}    ${password}
   Click Element    ${Chech_box}
   Click Button    ${btn_Login}   
   Wait Until Page Contains    Account Created Successfully
   Capture Page Screenshot        C:/Users/DhineshlingamNataraj/eclipse-workspace/Ecommerce/Result/Screenshot.png