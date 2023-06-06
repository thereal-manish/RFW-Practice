*** Settings ***
Library         SeleniumLibrary
Library         AngularJSLibrary

*** Test Cases ***
AegularAutomation
    Open Browser    https://www.globalsqa.com/samplepagetest/    Chrome
    
    AngularJSLibrary.Wait For Angular
    Input Text    model=websiteUrl    https://example.com
    
    