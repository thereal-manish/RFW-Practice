*** Settings ***
Documentation    This file has to verify the format of each data cell
Library   SeleniumLibrary
# Library    ExcelUtil
Library    String
Library    ExcellentLibrary
Library   ExcelLibrary
Library    Collections
Variables    ../TestData/pattern.py

*** Variables ***
${res}    pass
${SUITE_NAME}    EmployeeDetails
${empColumnName}        Emp ID
${nameColumnName}       Name
${emailColumnName}       Email
${mobNoColumnName}      Mobile No
${resColumnName}        Result



*** Test Cases ***
Verify format of data from Each cell

    Open Workbook    EmployeeDatas.xlsx    alias=Test Data

    Switch Sheet    EmployeeDetails
    # Write Excel Column    5    Pass    2    EmployeeDetails 
              
    

     @{sheetData}    Read Sheet Data     get_column_names_from_header_row=True
      ${rowCount}    Get Row Count
      Log    ${rowCount}

      ${colCount}    Get Column Count  
      Log    ${colCount}  

    FOR    ${row_data}    IN    @{sheetData}
        Log    ${row_data} 
        FOR  ${rowIndex}  IN RANGE  2  ${rowCount}+1

                ${empNo}    Get From Dictionary    ${row_data}    ${empColumnName}
                Log    ${empNo}
    
                ${employeeId}    Convert To String    ${empNo}
                ${empId}    Get Regexp Matches    ${employeeId}   ${idRegPattern}
                Log    ${empId}

                ${nameValue}    Get From Dictionary    ${row_data}    ${nameColumnName}
                Log    ${nameValue}
                ${empName}    Get Regexp Matches    ${nameValue}    ${nameRegExp}
                Log    ${empName}

                ${email}    Get From Dictionary    ${row_data}    ${emailColumnName}
                Log    ${email}

                ${empEmail}    Get Regexp Matches    ${email}    ${emailRegExp}
                Log    ${empEmail}

                ${mobileNo}    Get From Dictionary    ${row_data}    ${mobNoColumnName}
                Log    ${mobileNo}

                ${empMobile}    Convert To String    ${mobileNo}

                ${empmobileNo}    Get Regexp Matches    ${empMobile}    ${mobileNoRegExp}
                Log    ${empmobileNo}

                ${resut}    Get From Dictionary    ${row_data}    ${resColumnName}
                Log    ${resut}

                ${con}    Evaluate    ${empId} != [] and ${empName} != [] and ${empEmail} != [] and ${empmobileNo} != []
                ${con2}   Evaluate    ${empId} == [] or ${empName} == [] or ${empEmail} == [] or ${empmobileNo} == []
                Open Excel Document    EmployeeDatas.xlsx    dc_001
                Run Keyword If    ${con}      Write Excel cell        ${rowIndex}    ${colCount}    fail    EmployeeDetails     
                Save Excel Document     EmployeeDatas.xlsx 
                
                Open Excel Document    EmployeeDatas.xlsx    dc_06785
                Run Keyword If    ${con2}    Write Excel Cell    ${rowIndex}    ${colCount}    pass    EmployeeDetails   
                Save Excel Document     EmployeeDatas.xlsx
                Close All Excel Documents 

            
       END     
    END

    Close Workbook
    # Open Excel    EmployeeDatas.xlsx
    # ${rowCount}    Get Row Count    EmployeeDetails
    # Log    ${rowCount}
    # ${colCount}    Get Column Count    EmployeeDetails 
    # Log    ${colCount}   

    # # Write Data By Coordinates    EmployeeDetails    2    5    Pass 
    # # Save Excel    EmployeeDatas.xlsx
   
 

    # ${data}    Read Cell Data By Coordinates    EmployeeDetails    2    3 
    # Log    ${data} 

    # FOR  ${rowIndex}  IN RANGE  2  ${rowCount}+1
    #     FOR  ${colIndex}  IN RANGE  5  ${colCount}+1

    #         ${empId}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    1
    #         Log    ${empId}  
        
    #         ${emp}    Convert To String    ${empId}
    #         ${emp1}    Get Regexp Matches    ${emp}    ^\\d{6}
    #         Log    ${emp1}
            

    #         ${name}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    2
    #         Log    ${name}  
        
    #         ${empName}    Get Regexp Matches    ${name}    ^[A-Za-z]{5,20}$
    #         Log    ${empName}

    #         ${email}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    3
    #         Log    ${email}  
        
    #         ${empEmail}    Get Regexp Matches    ${email}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
    #         Log    ${empEmail}

    #         ${mobileNo}    Read Cell Data By Coordinates    EmployeeDetails    ${rowIndex}    4
    #         Log    ${mobileNo}  
        
    #         ${empMobile}    Convert To String    ${mobileNo}

    #         ${empmobileNo}    Get Regexp Matches    ${empMobile}    ^[0-9]{1,10}$
    #         Log    ${empmobileNo}

    #         # evaluate condition 
    #         ${con}    Evaluate    ${emp1} != [] and ${empName} != [] and ${empEmail} != [] and ${empmobileNo} != []
    #         ${con2}    Evaluate    ${emp1} == [] or ${empName} == [] or ${empEmail} == [] or ${empmobileNo} == []

    #         Run Keyword If   ${con}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
    #         Save Excel    EmployeeDatas.xlsx

    #         Run Keyword If    ${con2}    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    fail
    #         Save Excel    EmployeeDatas.xlsx
            
        

    #         # Open Excel    EmployeeDatas.xlsx
    #         # Run Keyword If   ${empName} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    fail
    #         # Save Excel    EmployeeDatas.xlsx

    #         # Open Excel    EmployeeDatas.xlsx
    #         # Run Keyword If   ${empEmail} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
    #         # Save Excel    EmployeeDatas.xlsx

    #         # Open Excel    EmployeeDatas.xlsx
    #         # Run Keyword If   ${empmobileNo} !=[]    Write Data By Coordinates    EmployeeDetails    ${rowIndex}    ${colIndex}    pass
    #         # Save Excel    EmployeeDatas.xlsx
 
    #     END  
            
    # END

      

   