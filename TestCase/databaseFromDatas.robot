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
${ename}    udhaya    


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
   
         
   



    
   

        