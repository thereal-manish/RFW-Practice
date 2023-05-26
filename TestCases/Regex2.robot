*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String
Library  yaml
Variables    ../TestData/exceldata.py
*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx
    ${rowCount}    Get Row Count    EmployeeDetails
    ${columnCount}    Get Column Count    EmployeeDetails
    FOR  ${columnIndex}  IN RANGE  1    ${columnCount}
        

        FOR  ${rowIndex}  IN RANGE  2    ${rowCount}+1
       
            ${regex}        Run Keyword If    ${columnIndex} == 1    Set Variable    ${Regex_empID}
            ...    ELSE IF     ${columnIndex} == 2   Set Variable    ${Regex_name}
            ...    ELSE IF     ${columnIndex} == 3    Set Variable    ${Regex_mail}
            ...    ELSE IF     ${columnIndex} == 4    Set Variable    ${Regex_mobile}         
            ${Data}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    ${columnIndex}
            ${cellData}    Convert To String    ${Data}
            ${matches}    Get Regexp Matches    ${cellData}    ${regex}
            

            IF  ${matches} == []
                Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${columnCount}    fail
                Save Excel     EmployeeDatas.xlsx
                BREAK

            ELSE
                Write Data By Coordinates     EmployeeDetails     ${rowIndex}     ${columnCount}     pass
                Save Excel     EmployeeDatas.xlsx 
            END

        END
        
    END

