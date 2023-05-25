*** Settings ***
Documentation    This file is for registering account
Library    SeleniumLibrary
Library    FakerLibrary
Library   ExcelLibrary
# have to install seleniumScreenshots
Library    Screenshot
Variables    ../TestData/config.py
Variables    ../TestData/registerPageTestData.py
Variables    ../TestData/invalidRegisterPageTestData.py
Variables    ../locators/homePage.py
Variables    ../locators/registerPage.py
Resource    ../Resources/DatasfromExcel.resource
Library    DataDriver    file=C:/Users/UdhayaParanthaman/Downloads/RFW-Practice/TestData/nopcommerceDataDriver.xlsx
Test Setup    Open Browser    ${url}    ${browserName}
# Test Teardown    Close Browser
Test Template    Valid Login Credentials

*** Variables ***
# ${firstName}    FakerLibrary.First Name
# ${lastName}    FakerLibrary.Last Name
# ${monthIndex}    FakerLibrary.Month Name
# ${yearIndex}    FakerLibrary.Year
# ${email}    FakerLibrary.Email  
# ${company}    FakerLibrary.Company
${email1} 
${pass1} 

  


*** Test Cases ***
Register User and Validating Registration detail ${email1} ${pass1}    abc    1234
    # [tags]    Smoke
    # check the mandatory functionalities


*** Keywords ***
Valid Login Credentials
    [Arguments]    ${emailId}    ${pass}
    Maximize Browser Window 
    Wait Until Element Is Visible    ${img_demoStore}    
    Click Link   ${lnk_register}
    Input Text    ${txt_email}    ${emailId} 
    
    # ${company}    FakerLibrary.Company  
    # Input Text    ${txt_company}    ${company}

    Input Password    ${txt_password}    ${pass} 
    Input Password    ${txt_cnfPassword}    ${pass}
    Sleep    5
    
         
    # Maximize Browser Window 
    # Wait Until Element Is Visible    ${img_demoStore}    
    # Click Link   ${lnk_register}
    
    # Select Radio Button    ${rdBtn_name}    ${genderName}
    
    # ${firstName}    FakerLibrary.First Name
    #  Input Text    ${txt_fName}    ${firstName}    
    
    # ${lastName}    FakerLibrary.Last Name
    # Input Text    ${txt_lName}    ${lastName}
    
    

    # Select From List By Label    ${date_locator}    ${dateIndex}
    
    # ${monthIndex}    FakerLibrary.Month Name
    # Select From List By Label    ${month_locator}    ${monthIndex} 
    
    # ${yearIndex}    FakerLibrary.Year
    # Select From List By Label    ${year_locator}    ${yearIndex}


    # ${email}    FakerLibrary.Email  
   
    
    # Should Be Equal    ${password}    ${confirmPassword}
   
    # Click Button    ${register_btn} 
    # Wait Until Page Contains    ${successRegisterPagetxt} 
    # Take Screenshot    ${CURDIR}../../results/${TEST NAME}.png
    # ...    # How to take screenshot for passed testcases
    # Capture Page Screenshot    C:/Users/UdhayaParanthaman/eclipse-workspace/RobotProjects/nopCommerceProject/result/screenshot.png 
 
# Register with incorrect data and validating 
#     [tags]    Regression
#     # checking the updated features
#     Maximize Browser Window 
#     Wait Until Element Is Visible    ${img_demoStore}
    
#     Click Link   ${lnk_register}
    
#     Input Text    ${txt_fName}    ${nameFirst}  

#     Input Text    ${txt_lName}    ${nameLast}

#     Input Text    ${txt_email}    ${invalidEmail}
     
#     Input Text    ${txt_company}    ${invalidCompany}

#     Input Password    ${txt_password}    ${invalidpassword} 
#     Input Password    ${txt_password}    ${invalidConfirmPassword} 
   
#     Click Button    ${register_btn} 
#     Wait Until Page Contains    ${errorMsgTxt} 
            

    
   
    
       
       
    
      
     
    
      

         
         
    
    