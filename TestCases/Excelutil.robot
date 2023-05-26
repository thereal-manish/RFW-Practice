*** Settings ***
Library    SeleniumLibrary
Library    ExcelUtil

*** Variables ***
${BROWSER}    chrome
${URL}    https://rahulshettyacademy.com/client
${EXCEL_FILE}    C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/TestCases/excelutil.xlsx
${first_name}    
${last_name} 
${email}  
${phone_number}
${Occupation}  
${password}  
${Confirm_password}
${data}
${Excelname}

*** Test Cases ***
Register User
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible      //a[@class='btn1']
    Click Element    //a[@class='btn1']
    Open Excel    ${EXCEL_FILE}
    ${Excelname}    Get Sheet Names
    Set Global Variable     ${Excelname}
    Log    ${Excelname}
Get row and column count values
    Get row and column count

*** Keywords ***
Get row and column count

   ${row_count}    Get Row Count    Registration
   Log    ${row_count}
   ${column_count}    Get Column Count    Registration
   Log    ${column_count}
  
#    Set Variable    ${rows}    
#    FOR  ${RowValues}  IN  RANGE   2    ${row_count}+1
#        log    ${RowValues}
   
#    END
   
# Fill Registration Form
   
#     Input Text    //input[@id='firstName']    ${first_name}
#     Input Text    //input[@id='lastName']    ${last_name}
#     Input Text    //input[@id='userEmail']    ${email}
#     Input Text    //input[@id='userPassword']    ${password}
#     Input Text    //input[@id='userMobile']   ${phone_number}
#     Select From List By Value    "//select[@formcontrolname='occupation']"    ${Occupation}
#     Click Element     //input[@value='Female']
#     Input Password    "//input[@id='userPassword']"    ${password}  

#     Input Password    "//input[@id='confirmPassword']"  ${Confirm_password}  
#     Click element    "//input[@type='checkbox']"
#     Click element    "//input[@id='login']"
    
