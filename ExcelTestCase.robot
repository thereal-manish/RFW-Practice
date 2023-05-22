*** Settings ***
Documentation    This file is for registering account
Library    SeleniumLibrary
Library    FakerLibrary
Library   ExcelUtil

*** Variables ***
${i}    0
${colCount}
${colId}

*** Test Cases ***
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

*** Keywords ***
Inner loop
    [Arguments]     @{row}    
    FOR     ${colIndex}    IN RANGE   1   ${colId}+1
	#reading cell data from Sheet 1
        Log    ${colIndex}
        ${data}     Read Cell Data By Coordinates   Register  @{row}    1
        Log    ${data}
        Open Browser    https://demo.nopcommerce.com/    chrome
        Click Link        //a[@class='ico-register']
        Input Text    Email    ${data}

        ${pwd}     Read Cell Data By Coordinates   Register  @{row}    2
        Input Password    Password    ${pwd}

        ${cnfPassword}     Read Cell Data By Coordinates   Register  @{row}    2
        Input Password    ConfirmPassword    ${cnfPassword}


        Sleep    5
    END



 

    
    
        

    # ${dats}    Get All Rows Data    Register.robo 
    # Log    ${dats}
    # ${mail}    Read Cell Data By Coordinates    Register.robo    2    1
    # Log    ${mail}
    # ${datas}    Get All Rows Data    Register.robo 
    # Log    ${datas}   

    



