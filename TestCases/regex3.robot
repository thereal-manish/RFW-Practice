*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String
Library    CustomKeywords.py

*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx   
    ${sheetName}    Set Variable    EmployeeDetails
    ${row_count}    Get Row Count    ${sheetName}   
    ${column_count}    Get Column Count    ${sheetName}   
     
    FOR    ${rowIndex}    IN RANGE    3    ${row_count}+1
        FOR    ${columnIndex}    IN RANGE     1    ${column_count}
            ${columnHeader}    Read Cell Data By Coordinates    ${sheetName}    1    ${columnIndex}
            ${regex}   Read Cell Data By Coordinates    ${sheetName}    2    ${columnIndex}
            ${cellData}     Read Cell Data By Coordinates    ${sheetName}    ${rowIndex}    ${columnIndex}
            ${Data}    Convert To String    ${cellData}
            ${matches}    Get Regexp Matches    ${Data}    ${regex}    
            IF    ${matches} == []
              Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Fail
             
               BREAK  
            ELSE
                Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Pass
            END           
        END
    END
    Save Excel    EmployeeDatas.xlsx
    
