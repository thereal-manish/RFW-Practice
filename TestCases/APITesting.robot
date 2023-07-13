*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
*** Variables ***
${petId}   5
*** Test Cases ***
Get petID
    Demo ApiTesting to get petId
    Demo PostApi
*** Keywords ***
Demo ApiTesting to get petId
    ${Response}    RequestsLibrary.GET    https://petstore3.swagger.io/api/v3/pet/${petId}   expected_status=200
    Log To Console    ${Response.json()}
      
Demo PostApi
    ${body}    Create Dictionary    id=10    name=doggie   
    ${response}    POST    https://petstore3.swagger.io/api/v3/pet    json=${body}
    Log    ${response}
    
    OperatingSystem.Get Binary File    results/Empty Firstname.jpeg    



   


# ${id}    Set Variable    ${response.json()}[id]
#     Set Suite Variable    ${id}