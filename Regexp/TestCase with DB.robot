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
#connection
${DBHost}         localhost
${DBName}         regexp
${DBPass}         root
${DBPort}         4306
${DBUser}         root

#data
${empID}          0
${empName}        Manish
${email}          manish@mail.com
${mobileNo}       8098120433 

#regexp
${emp_regexp}     \\\\d{1,6}
${email_regexp}     ^[a-zA-Z0-9_.]+@[a-zA-Z0-9-]+\\\\.[a-zA-Z0-9-.]+$
${name_regexp}    ^[A-Za-z ]{5,20}$
${phone_regexp}    ^[0-9]{10}$
@{regexp_list}      ${emp_regexp}     ${email_regexp}     ${name_regexp}    ${phone_regexp}   
# ${curr_regexp}
# AND    ${curr_regexp}    IN    @{regexp_list}

#column names
${empID_colname}        employee_Id
${empName_colname}      employee_Name
${email_colname}        email
${mobile_colname}        mobile_Number
${result_colname}        validation_Results
@{columnList}            ${empID_colname}    ${empName_colname}      ${email_colname}        ${mobile_colname}        #${result_colname}        

#database
${tableName}    employeeDetails


*** Test Cases ***
#Get regexp match
#    Should Match Regexp   mani.co    ${email_regexp}

Drop existing table
    [Documentation]    This keyword drops existing table
    Execute SQL String    DROP TABLE ${tableName}

Create EmployeeDetails table
    [Documentation]    This keyword creates table in database
    ${query}    Set Variable    CREATE TABLE ${tableName} (${empID_colname} varchar(255) PRIMARY KEY NOT NULL,${empName_colname} varchar(255),${email_colname} varchar(255),${mobile_colname} varchar(255), ${result_colname} varchar(255));
    Execute SQL String    ${query}
    
Insert regexps
    [Documentation]    This keyword inserts regular expression into row number 1
    Log To Console    ${emp_regexp}
    Execute Sql String    Insert into ${tableName} (${empID_colname},${empName_colname},${email_colname},${mobile_colname}) values ('${emp_regexp}','${name_regexp}','${email_regexp}','${phone_regexp}')

Insert data into EmployeeDetails table
    [Documentation]  This step inserts data into database table
    FOR  ${INDEX}  IN RANGE    1    10
        ${empID}    Evaluate    ${empID}+1
        ${mobileNo}    Evaluate    ${mobileNo}+1
        Execute SQL String    INSERT INTO ${tableName} (${empID_colname},${empName_colname},${email_colname},${mobile_colname}) values ('${empID}','${empName}','${email}','${mobileNo}')    
    END

get regexps and compare
    [Documentation]    This keyword checks regexps for all the database
    Execute Sql String    update ${tableName} SET ${result_colname}='Pass' where ${columnList}[0]!='${emp_regexp}'
    FOR    ${curr_column}    IN    @{columnList}    
        @{regexp_row}    Query    select ${curr_column} from ${tableName} limit 1
        ${regexp_txt}    String.Strip String    @{regexp_row}[0]
        # ${regexp_unstripped}    Set Variable    @{regexp_row}[0]
        ${regexp_txt_with_escape}    Replace String    ${regexp_txt}    search_for=\\    replace_with=\\\
        # Log    ${regexp_txt}
        

        ${get_row}    Set Variable    select ${curr_column} from ${tableName} where ${curr_column} != '${regexp_txt_with_escape}'
        @{curr_row}    Query    ${get_row} 
            
            FOR  ${row}  IN  @{curr_row}
                ${curr_cell}    Strip String    @{row}
                # Get Regexp Matches    ${curr_cell}    ${regexp_txt}

                ${regexp_match}    Run Keyword And Return Status     should match regexp    ${curr_cell}    ${regexp_txt_with_escape}
                IF  '${regexp_match}' == 'False'
                    ${result_sql_string}    Set Variable    Select ${result_colname} from ${tableName} where ${curr_column}='${curr_cell}' AND ${result_colname}='Fail'
                    ${result_curr_cell}    Execute Sql String    ${result_sql_string}
                    IF  '${result_curr_cell}'=='${NULL}'
                        ${result_query}    Set Variable    update ${tableName} SET ${result_colname}='Fail' where ${curr_column}='${curr_cell}'
                        Execute Sql String    ${result_query}
                    END                    
                END
                # Run Keyword If    ${regexp_match}
                
            END
        

    END