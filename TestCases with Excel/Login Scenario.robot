*** Settings ***
Documentation      This test suite is for tesing excellibrary
Library            ExcellentLibrary
Library            SeleniumLibrary
Library            Collections
Library            ExcelLibrary
Variables          ../Test Data/Login_with_excel.yaml
Variables          ../Locators/LoginPage.yaml
Variables          ../Config/Config.yaml
Suite Setup        Set Selenium Implicit Wait    3s
Test Setup         Open Browser    ${url}    ${browser}
Test Teardown      Close Browser


*** Test Cases ***
# Open and read excel data
#     Open Workbook   ${CURDIR}\\..\\Test Data\\LoginPage.xlsx        alias=TestDataSheet
#     Switch Sheet    ${sheetName}
#     @{dataSheet}    Read Sheet Data    get_column_names_from_header_row=True
#     FOR    ${row}    IN    @{dataSheet}
#         ${username}    Get From Dictionary    ${row}    username
#         Log    ${username}
#         ${password}    Get From Dictionary    ${row}    password
#         Log    ${password}
#     END 
#     Close Workbook    alias=TestDataSheet
    


Enter invalid username and valid password
    
    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook


    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${ivu_ivp_error_msg}

Enter valid username and invalid password

    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${ivu_ivp_error_msg} 

Enter null username and invalid password

    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${uname_req_txt}   

   
        
Enter valid username and valid password

    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain Element   ${cart_icon}    
    Page Should Contain   ${products_txt}    

Enter valid username and null password

    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${pwd_req_txt}   


Enter invalid username and invalid password
    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text             ${username_loc}    ${username_local}
    Input Password         ${password_loc}    ${password_local}
    Click Button           ${login_btn_loc}
    Page Should Contain    ${ivu_ivp_error_msg}


Enter null username and null password

    Open Workbook    ${CURDIR}\\..\\Test Data\\LoginPage.xlsx    alias=Test Data
    Switch Sheet    ${SUITE_NAME}
    @{sheetData}    Read Sheet Data    get_column_names_from_header_row=True
    FOR    ${row_data}    IN    @{sheetData}
        ${TC_name_excel}    Get From Dictionary    ${row_data}    ${primaryKey_excel}
        IF   '${TEST_NAME}'=='${TC_name_excel}'
            ${username_local}    Get From Dictionary    ${row_data}    ${username_excel}
            ${password_local}    Get From Dictionary    ${row_data}    ${password_excel}
            Set Test Variable    ${username_local}
            Set Test Variable    ${password_local}
        END
    END
    Close Workbook

    Maximize Browser Window
    Input Text            ${username_loc}        ${username_local}
    Input Password        ${password_loc}        ${password_local}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${uname_req_txt}