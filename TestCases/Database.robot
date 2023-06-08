*** Settings ***
Documentation    This file has to verify the format of each data cell
Suite Setup       Connect To Database
...    ${DB}    ${DBname}    ${DBusername}
...    ${DBpassword}    ${DBhost}    ${DBport}
Library    SeleniumLibrary
Library    String
Library    DatabaseLibrary
Suite Teardown    Disconnect From Database
Variables    ../TestData/DBconfig.yaml
Variables    ../TestData/Query.yaml
*** Test Cases ***
Create New Table and Insert values
    [Documentation]     Testcases for to set pass and fail in result column using Databaselibrary
    create table and Insert Testdata using query
    Using for loop to iterate row count and set Fail and Pass in result column
*** Keywords ***
create table and Insert Testdata using query
    [Documentation]    using mysql query to create table and insert values into that table
    Query    DROP TABLE regex.employeedatas
    ${table}=    Execute Sql String    ${createQuery}
    ${insert}=    Execute Sql Script   ${InsertQuery}

Using for loop to iterate row count and set Fail and Pass in result column
    [Documentation]    Set pass, Fail in result column using mysql query
    @{columnHeader}    Query    ${columnHeader_val}
    @{rowcount}    query     ${Count}
    ${rowCount_val}    Set Variable   @{rowcount}[0]
    FOR  ${index}   IN RANGE    1    ${rowCount_val}
        FOR   ${columnvalue}    IN     @{ColumnHeader}
            ${col_val_txt}    Strip String    @{columnvalue}
            @{regexp_row}    Query    select ${col_val_txt} from ${tableName} limit 1
            ${regexp_txt}    String.Strip String    @{regexp_row}[0]
            ${row1Validation}    Query    select ${col_val_txt} from ${tableName} limit ${index},1;
            ${valueData}    String.Strip String    @{row1Validation}[0]
            ${reg_matches}    Get Regexp Matches      ${valueData}    ${regexp_txt}
            IF  ${reg_matches} == []
                Execute Sql String
                ...    update ${tableName} SET ${result_colname}= "Fail" where ${col_val_txt} = '${valueData}'
                BREAK
            ELSE
                Execute Sql String
                ...    update ${tableName} SET ${result_colname}='Pass' where ${result_colname} = ''
            END
        END
    END