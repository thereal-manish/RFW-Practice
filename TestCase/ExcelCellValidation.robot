*** Settings ***
Documentation    This file has to verify the format of each data cell
Library   SeleniumLibrary
Library    ExcelUtil
Library    String
Library   Collections
Variables    ../TestData/pattern.py


*** Test Cases ***
Verify format of data from Each cell

    Open Excel    EmployeeDatas.xlsx
    ${rowCount}    Get Row Count    EmployeeDetails
    Log    ${rowCount}
    ${colCount}    Get Column Count    EmployeeDetails 
    Log    ${colCount}  
 
    FOR  ${rowIndex}  IN RANGE  2    ${rowCount}+1

        FOR  ${colIndex}  IN RANGE  1    ${colCount}

            # ${empNo}    Get From Dictionary    ${rowIndex}    ${colIndex}
            # Log    ${empNo}

            ${Data}      Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}
            ${cellData}    Convert To String    ${Data}

            
            
            ${regex}    Run Keyword If    ${colIndex} == 1     Set Variable    ${idRegPattern}

            ...    ELSE IF    '${colIndex}' == '2'    Set Variable    ${nameRegExp}

            ...    ELSE IF    '${colIndex}' == '3'    Set Variable    ${emailRegExp}

            ...    ELSE IF    '${colIndex}' == '4'    Set Variable    ${mobileNoRegExp}


            ${Data}      Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}

            ${cellData}    Convert To String    ${Data}
            ${matches}     Get Regexp Matches    ${cellData}    ${regex}

            IF  ${matches} == [ ]
                Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colCount}    fail 
                Save Excel    EmployeeDatas.xlsx
                BREAK
                
            ELSE
                Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colCount}    pass
                Save Excel    EmployeeDatas.xlsx    
            END
            
        END 
    END       