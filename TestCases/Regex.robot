*** Settings ***
Documentation    This file has to verify the format of each data cell
Library   SeleniumLibrary
Library    ExcelUtil
Library    String
*** Variables ***
${Regex_empID}    ^\\d{6}
${Regex_mail}    ^[a-zA-Z0-9_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
${Regex_name}    ^[A-Za-z ]{5,20}$
${Regex_mobile}    ^[0-9]{10}$

*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx
    ${rowCount}    Get Row Count    EmployeeDetails
    ${columnCount}    Get Column Count    EmployeeDetails
    FOR  ${rowIndex}  IN RANGE  2  ${rowCount}+1
       
       
        ${empId}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    1
        ${emp}    Convert To String    ${empId}
        ${emp1}    Get Regexp Matches    ${emp}    ${Regex_empID}
           
        ${name}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}     2 
        ${empName}    Get Regexp Matches    ${name}    ${Regex_name} 
       
        
        ${email}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}     3
        ${empEmail}    Get Regexp Matches    ${email}    ${Regex_mail}
        
         
         ${mobileNo}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}     4 
        ${empMobile}    Convert To String    ${mobileNo}

        ${empmobileNo}    Get Regexp Matches    ${empMobile}    ${Regex_mobile}
    
        ${condition}    Evaluate    ${emp1} != [] and ${empName} != [] and ${empEmail} != [] and ${empmobileNo} != []
        ${condition2}    Evaluate    ${emp1} == [] or ${empName} == [] or ${empEmail} == [] or ${empmobileNo} == []
        Run Keyword If    ${condition}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}   ${columnCount}   Pass
        Save Excel    EmployeeDatas.xlsx
        Run Keyword If    ${condition2}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${columnCount}   Fail
        Save Excel    EmployeeDatas.xlsx

       END
        
    
    


    
      