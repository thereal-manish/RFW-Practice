*** Settings ***
Documentation    This file has to verify the format of each data cell
Suite Setup       Connect To Database    pymysql    regex    root    root    localhost    4306
Library    SeleniumLibrary
Library    String
Library    DatabaseLibrary

*** Variables ***
${tablename}    employeedatas
${result_colname}        result
*** Test Cases ***
Create Table
    Query    DROP TABLE regex.employeedatas
    ${table}=    Execute Sql String    CREATE TABLE regex.employeedatas (empid varchar(255),ename varchar(255),email varchar(255),phoneNo varchar(255),result varchar(255));
    Log    ${table}
    ${insert}=    Execute Sql Script   C:/Users/DhineshlingamNataraj/Downloads/eclipse-workspace-robotframeworkNew2/RFW-Practice/TestCases/datas.sql  
    @{columnHeader}    Query    SELECT COLUMN_NAME FROM information_schema.columns where table_schema='regex' AND table_name='employeedatas' AND column_name!='result' 
    @{rowcount}    query     SELECT COUNT(*) AS Row_Count FROM employeedatas;  
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
                ${result_Fail}    Set Variable    update ${tableName} SET ${result_colname}= "Fail" where ${col_val_txt} = '${valueData}'
                ${Execute_result}    Execute Sql String    ${result_Fail}
                BREAK
            ELSE   
                Execute Sql String    update ${tableName} SET ${result_colname}='Pass' where ${result_colname} = ''   
            END   
            
        END
    END  
































      # @{rowlist2}    Create List    ${row2}
    # @{rowlist}    Create List    ${row1value}
    
    # ${row_1}=    Evaluate    (${rowlist[0][0]})
    # Log    ${row_1}
    # ${row_2}=    Evaluate    (${rowlist2[0][0]})
    # IF  '${result_curr_cell}'=='${NULL}'
    #                 ${result_query}    Set Variable    update ${tableName} SET ${result_colname}='Fail' where ${col_val_txt}='${valueData}'
    #                 Execute Sql String    ${result_query}
    #             END                
            # FOR    ${rowiterate}    IN    @{row_1}
        #     FOR    ${var}    IN   @{row_2}
        #     #     Log    ${row2iterate}
        #      ${strip_column}    Strip String    @{columnvalue}    
        #      Log    ${strip_column}
    
        #      Log    ${rowiterate}
        #         # ${query_row}    Query   select*from employeedats where 
        #         # #  ${list}    Get Index From List    ${row_2}    ${index1}
        #         # Log    ${index2} 
        #         # Log    ${index1} 
        #         # IF    '${index1}'== '${index2}'    
        #         #    ${list}    Get Index From List    ${row_2}    ${row2iterate}
        #         Log    ${var}
        #     END    
        #  END 
             #  ${regex}    Set Variable     
        # END
            
      # @{row1value}    query    SELECT empid, ename, email,phoneNo,result FROM employeedatas LIMIT 1;
    # @{row2}    Query    SELECT empid, ename, email,phoneNo,result FROM employeedatas LIMIT 1 Offset 1;   
    #  FOR  ${columnIndex}  IN RANGE   1  @{column_count[0]}
    #         Log    ${columncount}
    #         ${regex}        
    #     END
    #  ${row set}    Evaluate     [ ('A',) , ('B',) , ('C',) , ('D',) , ('E',) , ('F',) , ('G',) ]    # just to reproduce result set from DB
    # ${first column A}=    Evaluate    [x[0] for x in ${row set}]    # works if row set's string representation can be passed to eval to get same object
    # Log List    ${first column A}
    # ${first column B}=    Create List
    # :FOR    ${row}    IN    @{row set}
    # \    Append To List    ${first column B}    ${row[0]}
    # Log List    ${first column B}
    # Lists Should Be Equal    ${first column A}    ${first column B}
    # @{column}    Create List    ${columnHeader}
    # ${type}    Evaluate    type($row1value)
    # Log    ${type}
    # FOR    ${index}    ${item}    IN ENUMERATE    @{items}
    # ${index} =    Evaluate    ${index} + 1
    # Log    Item ${index} is '${item}'.
    # END

    # ${row1}    Query    SELECT * FROM regex.employeedatas LIMIT 1;
    # @{rowcount}    query     SELECT COUNT(*) AS Row_Count FROM employeedatas;  
    # @{columncount}    Query    SELECT COUNT(*) AS column_Count FROM employeedatas;  
    # ${type}    Evaluate    type($rowcount)
    # Log    ${type}
    # ${typecol}    Evaluate    type($columncount)
    # Log    ${typecol}
     #  ${column_1}=    Evaluate    (@{column[0][${index}]})
    # FOR   ${columnvalue}    IN    @{ColumnHeader}
    #     ${strip_column}    Strip String    @{columnvalue}    
    #     # ${index} =    Evaluate    ${index} + 1
    #     Log    ${strip_column}
    
    # END
    