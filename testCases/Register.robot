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
Test Teardown    Close Browser


*** Test Cases ***     
Register User and Validating Registration details
    [Tags]    smoke
    Maximize Browser Window 
    Wait Until Element Is Visible    ${img_demoStore}    
    Click Link   ${lnk_register}
    
    Select Radio Button    ${rdBtn_name}    ${genderName}
    
    ${firstName}    FakerLibrary.First Name
    Input Text    ${txt_fName}    ${firstName}    
    
    ${lastName}    FakerLibrary.Last Name
    Input Text    ${txt_lName}    ${lastName}

    ${monthIndex}    FakerLibrary.Month Name
    ${yearIndex}    FakerLibrary.Year
    Select From List By Label    ${date_locator}    ${dateIndex}
    Select From List By Label    ${month_locator}    ${monthIndex} 
    Select From List By Value    ${year_locator}    ${yearIndex}
    

    ${email}    FakerLibrary.Email    
    Input Text    ${txt_email}    ${email} 
    
    ${company}    FakerLibrary.Company  
    Input Text    ${txt_company}    ${company}

    Input Password    ${txt_password}    ${password} 
    Input Password    ${txt_cnfPassword}    ${confirmPassword}
    
    Should Be Equal    ${password}    ${confirmPassword}
   
    Click Button    ${register_btn} 
    Wait Until Page Contains    ${successRegisterPagetxt} 
    
    # How to take screenshot for passed testcases
    Capture Page Screenshot    C:/Users/kumaran/eclipse-workspace/robotframework1/nopCommerceRFWProjects/result/screenshot.png 
 
Register with incorrect data and validating 
    [Tags]    regression
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
    # Wait Until Page Contains    ${successRegisterPagetxt}
    Wait Until Page Contains    ${errorMsgTxt}

    
   
    
       
       
    
      
     
    
      

         
         
    
    