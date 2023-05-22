*** Settings ***
Documentation    This file is for registering account
Library    SeleniumLibrary
Library   ExcelUtil


*** Variables ***
${colId}

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
