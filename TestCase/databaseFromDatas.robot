*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String
Library    pymysql
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${DBHost}         localhost
${DBName}         demo
${DBPass}         root
${DBPort}         3306
${DBUser}         root


${emp_regexp}     \\\\d{1,6}
${email_regexp}     ^[a-zA-Z0-9_.]+@[a-zA-Z0-9-]+\\\\.[a-zA-Z0-9-.]+$
${name_regexp}    ^[A-Za-z ]{5,20}$
${phone_regexp}    ^[0-9]{10}$
@{regexp_list}      ${emp_regexp}     ${email_regexp}     ${name_regexp}    ${phone_regexp}  


#column names
${empID_colname}        employee_Id
${empName_colname}      employee_Name
${email_colname}        email
${mobile_colname}        mobile_Number
${result_colname}        Result

${ename}    udhaya    
${tableName}    employeeDetails
${result_colname}        Results
@{columnList}            ${empID_colname}    ${empName_colname}      ${email_colname}        ${mobile_colname}        #${result_colname}        



*** Test Cases ***
# connect to database
    # Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
Create EmployeeDetails table
    ${output}    Execute SQL String    CREATE TABLE EmployeeDetails (empId varChar(255),ename varchar(255),email varchar(255),MobileNo Varchar(255), Result varchar(255));
    Log    ${output}
    # Should Be Equal As Strings    ${output}    None

Verify Data Insertion in EmployeeDetails table    
...     [documentation]  This test case verifies that user is able to insert data in the table successfully
    ${output}  Execute SQL Script    C:/Users/UdhayaParanthaman/Downloads/RFW-Practice/TestCase/insert.sql
    Should Be Equal As Strings  ${output}  None

Verify count row
    ${rowcount} =    Execute SQL String    SELECT COUNT(empId) FROM EmployeeDetails
    Log    ${rowcount}
# Verify that Delete a EmployeeDetails Table
#     [documentation]  This test case verifies that a user can delete a Table
#     ${output}=  Execute SQL String  DROP TABLE EmployeeDetails;


Verify regexps and compare with Test Datas
    ${data}    Query    Select * from EmployeeDetails
    Log    ${data}


# Verify regexps and compare with Test Datas
#     [Documentation]    This keyword checks regexps for all the database
#     Execute Sql String    update ${tableName} SET ${result_colname}='Pass' where ${columnList}[0]!='${emp_regexp}'
#     FOR    ${curr_column}    IN    @{columnList}    
#         @{regexp_row}    Query    select ${curr_column} from ${tableName} limit 1
#         ${regexp_txt}    String.Strip String    @{regexp_row}[0]
#         # ${regexp_unstripped}    Set Variable    @{regexp_row}[0]
#         ${regexp_txt_with_escape}    Replace String    ${regexp_txt}    search_for=\\    replace_with=\\\
#         # Log    ${regexp_txt}
        

#         ${get_row}    Set Variable    select ${curr_column} from ${tableName} where ${curr_column} != '${regexp_txt_with_escape}'
#         @{curr_row}    Query    ${get_row} 
            
#         FOR  ${row}  IN  @{curr_row}
#             ${curr_cell}    Strip String    @{row}
#             # Get Regexp Matches    ${curr_cell}    ${regexp_txt}

#             ${regexp_match}    Run Keyword And Return Status     should match regexp    ${curr_cell}    ${regexp_txt_with_escape}
#             IF  '${regexp_match}' == 'False'
#                 ${result_sql_string}    Set Variable    Select ${result_colname} from ${tableName} where ${curr_column}='${curr_cell}' AND ${result_colname}='Fail'
#                 ${result_curr_cell}    Execute Sql String    ${result_sql_string}

#                 IF  '${result_curr_cell}'=='${NULL}'
#                     ${result_query}    Set Variable    update ${tableName} SET ${result_colname}='Fail' where ${curr_column}='${curr_cell}'
#                     Execute Sql String    ${result_query}
#                 END                    
#             END
#             # Run Keyword If    ${regexp_match}
            
#         END
    

#     END
         
   



    
   

        