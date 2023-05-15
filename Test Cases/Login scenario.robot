*** Settings ***
Documentation    This test suite is to perform login scenario testcases
Library          SeleniumLibrary
Variables        ../Config/Config.py
Variables        ../Test Data/LoginPage.py
Variables        ../Locators/LoginPage.py
Test Setup       Open Browser    ${url}    ${browser}    
Test Teardown    Close Browser

*** Test Cases ***
Enter invalid username and invalid password
    Maximize Browser Window
    Input Text            ${username_loc}        ${ivusername}
    Input Password        ${password_loc}        ${ivpassword}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${ivu_ivp_error_msg}    
       
Enter invalid username and valid password
    Maximize Browser Window
    Input Text            ${username_loc}        ${ivusername}
    Input Password        ${password_loc}        ${vpassword}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${ivu_ivp_error_msg}    
    
Enter valid username and invalid password
    Maximize Browser Window
    Input Text            ${username_loc}        ${vusername}
    Input Password        ${password_loc}        ${ivpassword}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${ivu_ivp_error_msg} 
    
Enter null username and invalid password
    Maximize Browser Window
    Input Text            ${username_loc}        ${null_data}
    Input Password        ${password_loc}        ${ivpassword}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${uname_req_txt}   
    
Enter valid username and null password
    Maximize Browser Window
    Input Text            ${username_loc}        ${ivusername}
    Input Password        ${password_loc}        ${null_data}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${pwd_req_txt}   
    
Enter null username and null password
    Maximize Browser Window
    Input Text            ${username_loc}        ${null_data}
    Input Password        ${password_loc}        ${null_data}
    Click Button          ${login_btn_loc}
    Page Should Contain   ${uname_req_txt}
         
Enter valid username and valid password
    Maximize Browser Window
    Input Text            ${username_loc}        ${vusername}
    Input Password        ${password_loc}        ${vpassword}
    Click Button          ${login_btn_loc}
    Page Should Contain Element   ${cart_icon}    
    Page Should Contain   ${products_txt}    