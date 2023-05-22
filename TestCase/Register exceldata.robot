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
Suite Setup    Open Browser    ${url}    ${browserName}
Test Teardown    Close Browser

*** Variables ***
${file}    C:/Users/UdhayaParanthaman/Downloads/RFW-Practice/nopcommerce.xlsx
# ${firstName}    FakerLibrary.First Name
# ${lastName}    FakerLibrary.Last Name
# ${monthIndex}    FakerLibrary.Month Name
# ${yearIndex}    FakerLibrary.Year
# ${email}    FakerLibrary.Email  
# ${company}    FakerLibrary.Company  
  


*** Test Cases ***
Register User and Validating Registration details
    [tags]    Smoke
    # check the mandatory functionalities
   

    Open Excel    nopcommerce.xlsx  
    ${rowCount}    Get Row Count    Register
    Log    ${rowCount}  

    ${colCount}    Get Column Count    Register 
      Log    ${colCount} 
    Set Test Variable    ${colId}    ${colCount} 

 
    FOR  ${rowIndex}  IN RANGE   2   ${rowCount}+1
            
    FOR     ${colIndex}    IN RANGE   1   ${colId}+1
	#reading cell data from Sheet 1
        Log    ${colIndex}
        ${data}     Read Cell Data By Coordinates   Register  ${rowIndex}    1
        Log    ${data}
        #  ${email}    FakerLibrary.Email  
        # Input Text    ${txt_email}    ${email} 

         Maximize Browser Window 
         Wait Until Element Is Visible    ${img_demoStore}    
         Click Link   ${lnk_register}
    
         Select Radio Button    ${rdBtn_name}    ${genderName}
    
        ${firstName}    FakerLibrary.First Name
        Input Text    ${txt_fName}    ${firstName}    
    
        ${lastName}    FakerLibrary.Last Name
        Input Text    ${txt_lName}    ${lastName}
    
    

        Select From List By Label    ${date_locator}    ${dateIndex}
    
        ${monthIndex}    FakerLibrary.Month Name
        Select From List By Label    ${month_locator}    ${monthIndex} 
    
        ${yearIndex}    FakerLibrary.Year
         Select From List By Label    ${year_locator}    ${yearIndex}



        Input Text    Email    ${data}

        ${company}    FakerLibrary.Company  
        Input Text    ${txt_company}    ${company}

        ${pwd}     Read Cell Data By Coordinates   Register  ${rowIndex}    1

        Input Password    ${txt_password}    ${pwd} 
        Input Password    ${txt_cnfPassword}    ${pwd}
    
        Should Be Equal    ${pwd}    ${pwd}
   
        Click Button    ${register_btn} 
        Wait Until Page Contains    ${successRegisterPagetxt} 
        Take Screenshot    ${CURDIR}../../results/${TEST NAME}.png
        ...    # How to take screenshot for passed testcases
        Capture Page Screenshot    C:/Users/UdhayaParanthaman/eclipse-workspace/RobotProjects/nopCommerceProject/result/screenshot.png 


        Sleep    5
    END
        Log    ${rowIndex}

    END

   
    
    
 
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
            

*** Keywords ***
check data drive from excel
    Open Excel    nopcommerce.xlsx  
    ${rowCount}    Get Row Count    Register
    Log    ${rowCount}  

    ${colCount}    Get Column Count    Register 
      Log    ${colCount} 
    Set Test Variable    ${colId}    ${colCount} 

 
    FOR  ${rowIndex}  IN RANGE   2   ${rowCount}+1
        Inner loop     ${rowIndex}
        Log    ${rowIndex}

    END
Inner loop
    [Arguments]     @{row}    
    FOR     ${colIndex}    IN RANGE   1   ${colId}+1
	#reading cell data from Sheet 1
        Log    ${colIndex}
        ${data}     Read Cell Data By Coordinates   Register  @{row}    ${colIndex}
        Log    ${data}
        Open Browser    https://demo.nopcommerce.com/    chrome
        Click Link        //a[@class='ico-register']
        Input Text    Email    ${data}
        Sleep    5
    END
    
   
    
       
       
    
      
     
    
      

         
         
    
    