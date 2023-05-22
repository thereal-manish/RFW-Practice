*** Settings ***
Documentation    This file has to verify the format of each data cell
Library   SeleniumLibrary
Library    ExcelUtil
Library    String

*** Variables ***
${pa}    pass


*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx
    ${rowCount}    Get Row Count    EmployeeDetails
    Log    ${rowCount}
    ${colCount}    Get Column Count    EmployeeDetails 
    Log    ${colCount}   

    # Write Data By Coordinates    EmployeeDetails    2    5    Pass 
    # Save Excel    EmployeeDatas.xlsx
   
 

    ${data}    Read Cell Data By Coordinates    EmployeeDetails    2    3 
    Log    ${data} 

    FOR  ${rowIndex}  IN RANGE  2  ${rowCount}+1
        FOR  ${colIndex}  IN RANGE  5  ${colCount}+1

            ${empId}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    1
            Log    ${empId}  
        
            ${emp}    Convert To String    ${empId}
            ${emp1}    Get Regexp Matches    ${emp}    ^\\d{6}
            Log    ${emp1}
            

            ${name}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    2
            Log    ${name}  
        
            ${empName}    Get Regexp Matches    ${name}    ^[A-Za-z]{5,20}$
            Log    ${empName}

            ${email}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    3
            Log    ${email}  
        
            ${empEmail}    Get Regexp Matches    ${email}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
            Log    ${empEmail}

            ${mobileNo}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    4
            Log    ${mobileNo}  
        
            ${empMobile}    Convert To String    ${mobileNo}

            ${empmobileNo}    Get Regexp Matches    ${empMobile}    ^[0-9]{1,10}$
            Log    ${empmobileNo}

            # evaluate condition 
            ${con}    Evaluate    ${emp1} != [] and ${empName} != [] and ${empEmail} != [] and ${empmobileNo} != []
            ${con2}    Evaluate    ${emp1} == [] or ${empName} == [] or ${empEmail} == [] or ${empmobileNo} == []

            Run Keyword If   ${con}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
            Save Excel    EmployeeDatas.xlsx

            Run Keyword If    ${con2}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    fail
            Save Excel    EmployeeDatas.xlsx
            
        

            # Open Excel    EmployeeDatas.xlsx
            # Run Keyword If   ${empName} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    fail
            # Save Excel    EmployeeDatas.xlsx

            # Open Excel    EmployeeDatas.xlsx
            # Run Keyword If   ${empEmail} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
            # Save Excel    EmployeeDatas.xlsx

            # Open Excel    EmployeeDatas.xlsx
            # Run Keyword If   ${empmobileNo} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
            # Save Excel    EmployeeDatas.xlsx
 
        END  
            
    END

      

   