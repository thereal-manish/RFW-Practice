*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}    https://maps.googleapis.com
${req_url}    /maps/api/place/nearbysearch/json?
${API_KEY}     AIzaSyDHI_KLiva8aZSnN3xdRaDoxvUoB4dsTMc


*** Test Cases ***
Get Geolocation
    Create Session    GoogleAPI    ${base_url}
    ${params}    Create Dictionary    location=-33.8670522,151.1957362    radius=500    types=restaurant    name=harbour    key=${API_KEY}

    # ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    GET On Session     GoogleAPI    ${req_url}    params=${params}    
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.content}
    # ${json}    Set Variable    ${response.json()}
    # Log    ${json}

# *** Keywords ***
# Get Request
#     [Arguments]    ${session}    ${url}    ${params}    ${headers}
#     ${url_with_params}    Set Variable    ${url}?key=${API_KEY}&${params.url_encode()}
#     ${response}    Get Request    ${session}    ${url_with_params}    ${params}    ${headers}
#     [Return]    ${response}
    