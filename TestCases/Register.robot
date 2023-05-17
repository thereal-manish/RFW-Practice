*** Settings ***
Documentation     Create new account
Library    SeleniumLibrary
Library    FakerLibrary    
Library    Screenshot    
Variables    ../TestData/Testdatavariables.yaml
Variables    ../TestData/Configdata.yaml
Variables    ../Locators/RegAccLocators.yaml
# Variables    ../TestData/TestVariables.py
Test Setup    Open Browser    ${url}    ${browser}    
Test Teardown     Close Browser

*** Variables ***
${Email}      
${password}  

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
   Capture Page Screenshot         C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/Result/Screenshot1.png

Invalid Email
   Maximize Browser Window
   Click Element    ${btn_RegisterHere}    
   Input Text    ${txt_FirstName}    ${mail_name}
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
   Capture Page Screenshot        C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/Result/Screenshot2.png

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
   Capture Page Screenshot          C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/Result/Screenshot3.png


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
   Capture Page Screenshot         C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/Result/Screenshot4.png


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
   Log    ${Firstname}
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
   Capture Page Screenshot          C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/Result/Screenshot5.png