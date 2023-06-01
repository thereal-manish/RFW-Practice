*** Settings ***
Documentation    This file has to verify the format of each data cell
Library    SeleniumLibrary
Library    ExcelUtil
Library    String
Library    ExcelLibrary
# Library    OperatingSystem
Library  openpyxl
# Library    pandas    
# Library   numpy

*** Test Cases ***
Verify format of data from Each cell
    Open Excel    EmployeeDatas.xlsx  
    ${sheetName}    Set Variable    EmployeeDetails
    ${row_count}    Get Row Count    ${sheetName}   
    ${column_count}    Get Column Count    ${sheetName}   

        FOR    ${rowIndex}    IN RANGE    3    ${row_count+1}
             FOR    ${columnIndex}    IN RANGE    1    ${column_count}
             
                 ${columnHeader}    Read Cell Data By Coordinates    ${sheetName}    1    ${columnIndex}
                 ${regex}     Read Cell Data By Coordinates    ${sheetName}    2    ${columnIndex}
                #  log    ${regex}
                 ${cellData}    Read Cell Data By Coordinates    ${sheetName}    ${rowIndex}    ${columnIndex}
                 ${data}    Convert To String    ${cellData}
                #  Log    ${data}
                 ${matches}    Get Regexp Matches    ${data}    ${regex}
                #  Log    ${matches}

                 IF    ${matches} == []
                     Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Fail      
                    BREAK 
                ELSE
                     Write Data By Coordinates    ${sheetName}    ${rowIndex}    ${column_count}    Pass
                    # Set Cell Formula    E2:E10    =B2+5
                END     
            END
        END 
    Save Excel    EmployeeDatas.xlsx  
    # openpyxl.Load Workbook
           
# Set Cell Text Color
#     Open Workbook    path/to/your/workbook.xlsx
#     Set Cell Value    Sheet1    A1    Hello, World!
#     Set Cell Text Color    Sheet1    A1    FF0000
#     Save Workbook    path/to/your/workbook.xlsx
#     Close Workbook

        

        