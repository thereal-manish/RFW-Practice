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
${DBName}         regex
${DBPass}         root
${DBPort}         4306
${DBUser}         root
${ename}    udhaya    


*** Test Cases ***
# connect to database
    # Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
Create EmployeeDetails table
    ${output} =    Execute SQL String    CREATE TABLE EmployeeDetails (empId int,ename varchar(255),email varchar(255),MobileNo int, Result varchar(255));
    Log    ${output}
    # Should Be Equal As Strings    ${output}    None

Verify Data Insertion in EmployeeDetails table
    [documentation]  This test case verifies that user is able to insert data in the table successfully
         FOR  ${INDEX}  IN RANGE    1    500  
             ${output1}=    Execute SQL String    INSERT INTO employeedetails (empId,ename, email, MobileNo, Result) values (123434,'udhaya', 'udhaya@gmail.com', 8167538,'fail')    
             Log    ${output1}
         END
         
   



    
   

        