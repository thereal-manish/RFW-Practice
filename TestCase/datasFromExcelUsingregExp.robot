*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String
Library    ExcelLibrary

*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx   
    ${sheetName}    Set Variable    EmployeeDetails
    ${row_count}    Get Row Count    ${sheetName}   
    ${column_count}    Get Column Count    ${sheetName}   

        FOR    ${rowIndex}    IN RANGE    3    ${row_count+1}
             FOR    ${columnIndex}    IN RANGE    1    ${column_count}

                 ${columnHeader}    Read Cell Data By Coordinates    ${sheetName}    1    ${columnIndex}
                 ${regex}     Read Cell Data By Coordinates    ${sheetName}    2    ${columnIndex}
                 log    ${regex}
                 ${cellData}    Read Cell Data By Coordinates    ${sheetName}    ${rowIndex}    ${columnIndex}
                 ${data}    Convert To String    ${cellData}
                 Log    ${data}
                 ${matches}    Get Regexp Matches    ${data}    ${regex}
                 Log    ${matches}

                 IF    ${matches} == []
                     Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Fail
                     Save Excel    EmployeeDatas.xlsx
                     BREAK 
                ELSE
                     Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Pass
                     Save Excel    EmployeeDatas.xlsx        
                 END
                 
            END

        END