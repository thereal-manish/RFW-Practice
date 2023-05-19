*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String

*** Variables ***

${num}    "^[0-9]{6,6}$"g

*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeesData.xlsx

    ${rowCount}    Get Row Count    EmployeeDetails

    Log    ${rowCount}

    ${colCount}    Get Column Count    EmployeeDetails

    Log    ${colCount}




    ${data}    Read Cell Data By Coordinates    EmployeeDetails    2    3

    Log    ${data}




    FOR    ${rowIndex}    IN RANGE    2    ${rowCount}+1

    ${empId}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    1

    Log    ${empId}

    ${emp}    Convert To String    ${empId}

    ${emp1}    Get Regexp Matches    ${emp}    ^\\d{6}

    Log    ${emp1}

    END




    FOR    ${rowIndex}    IN RANGE    2    ${rowCount}+1

    ${name}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    2

    Log    ${name}

    ${empName}    Get Regexp Matches    ${name}    ^[A-Za-z]{5,20}$

    Log    ${empName}
    END




    FOR    ${rowIndex}    IN RANGE    2    ${rowCount}+1

    ${email}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    3

    Log    ${email}

    ${empEmail}    Get Regexp Matches    ${email}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$

    Log    ${empEmail}

    END




    FOR    ${rowIndex}    IN RANGE    2    ${rowCount}+1

    ${mobileNo}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    4

    Log    ${mobileNo}

    ${empMobile}    Convert To String    ${mobileNo}

    ${empmobileNo}    Get Regexp Matches    ${empMobile}    ^[0-9]{1,10}$

    Log    ${empmobileNo}

    END