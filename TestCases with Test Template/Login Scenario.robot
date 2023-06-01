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
suite Setup         Open Browser    ${url}    ${browser}
# Test Teardown      Close Browser
Test Template      Login Template


*** Variables ***
# ${data_org}    10

*** Test Cases ***

*** Keywords ***
Login Template
    Input Text    ${username}    ${password}











#################################### datatype conversion ####################################
# test data
#     ${data_int}    Convert To Integer    ${data_org}
#     ${type_data_int}    Evaluate    type($data_int)
#     Log    ${data_int}
#     Log    ${type_data_int}
#     ${data_num}    Convert To Number    ${data_org}
#     ${type_data_num}    Evaluate    type($data_num)
#     Log    ${data_num}
#     Log    ${type_data_num}
#     ${data_str}    Convert To String    ${data_org}
#     ${type_data_str}    Evaluate    type($data_str)
#     Log    ${data_str}
#     Log    ${type_data_str}
#     Log    "${data_int}"
#     ${var}    Set Variable    10.0
#     Log    ${var}
