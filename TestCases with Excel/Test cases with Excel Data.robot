*** Settings ***
Documentation      This test suite is for tesing excellibrary-xwfintech
Library            ExcellentLibrary
Library            SeleniumLibrary
Library            Collections

*** Variables ***
${sheetName}        Sheet1


*** Test Cases ***
Open and read excel data
    Open Workbook   ${CURDIR}\\..\\Test Data\\LoginPage.xlsx        alias=TestDataSheet
    Switch Sheet    ${sheetName}
    @{dataSheet}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row}    IN    @{dataSheet}
        ${username}    Get From Dictionary    ${row}    username
        Log    ${username}
        ${password}    Get From Dictionary    ${row}    password
        Log    ${password}
    END 
    Close Workbook    alias=TestDataSheet
    