*** Settings ***
Documentation    This file is for registering account
Library    SeleniumLibrary
Library    FakerLibrary
# have to install seleniumScreenshots
Library    Screenshot
Variables    ../TestData/registerPageTestData.py
Variables    ../TestData/config.py
Variables    ../locators/homePage.py
Variables    ../locators/registerPage.py
Variables    ../TestData/invalidRegisterPageTestData.py
Test Setup    Open Browser    ${url}    ${browserName}
# Test Teardown    Close Browser

*** Variables ***
${firstName}    FakerLibrary.First Name
${lastName}    FakerLibrary.Last Name
${monthIndex}    FakerLibrary.Month Name
${yearIndex}    FakerLibrary.Year
${email}    FakerLibrary.Email  
${company}    FakerLibrary.Company  
  


*** Test Cases ***
Register User and Validating Registration details
    [tags]    Smoke
    # check the mandatory functionalities
    Maximize Browser Window 
    Wait Until Element Is Visible    ${img_demoStore}    
    Click Link   ${lnk_register}
    
    Select Radio Button    ${rdBtn_name}    ${genderName}
    
    Input Text    ${txt_fName}    ${firstName}    
    
    Input Text    ${txt_lName}    ${lastName}

    Select From List By Label    ${date_locator}    ${dateIndex}
    Select From List By Label    ${month_locator}    ${monthIndex} 
    Select From List By Label    ${year_locator}    ${yearIndex}
    

    Input Text    ${txt_email}    ${email} 
    
    Input Text    ${txt_company}    ${company}

    Input Password    ${txt_password}    ${password} 
    Input Password    ${txt_cnfPassword}    ${confirmPassword}
    
    Should Be Equal    ${password}    ${confirmPassword}
   
    Click Button    ${register_btn} 
    Wait Until Page Contains    ${successRegisterPagetxt} 
    
    # How to take screenshot for passed testcases
    Capture Page Screenshot    C:/Users/UdhayaParanthaman/eclipse-workspace/RobotProjects/nopCommerceProject/result/screenshot.png 
 
Register with incorrect data and validating 
    [tags]    Regression
    # checking the updated features
    Maximize Browser Window 
    Wait Until Element Is Visible    ${img_demoStore}
    
    Click Link   ${lnk_register}
    
    Input Text    ${txt_fName}    ${nameFirst}  

    Input Text    ${txt_lName}    ${nameLast}

    Input Text    ${txt_email}    ${invalidEmail}
     
    Input Text    ${txt_company}    ${invalidCompany}

    Input Password    ${txt_password}    ${invalidpassword} 
    Input Password    ${txt_password}    ${invalidConfirmPassword} 
   
    Click Button    ${register_btn} 
    Wait Until Page Contains    ${errorMsgTxt}         

    
   
    
       
       
    
      
     
    
      

         
         
    
    