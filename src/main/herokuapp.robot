*** Settings ***
Documentation               API test for herokuapp
Library                     RequestsLibrary
Library                     JSONLibrary
Library                     OperatingSystem
Library                     XML

*** Variables ***
${base_url}                 https://ghibliapi.herokuapp.com
${vehicle}                  /vehicles/

*** Test Cases ***
Get Vehicles
    Create Session          Get Vehicles         ${base_url}         verify=True
    ${response}=            Get Request          Get Vehicles        uri=${vehicle}
    Log                     ${response.json()}
    Set Global Variable     ${response}
    ${expected_json}=       Get File            src/main/expected_json/expected_vehicles_data.json
    Should Be True          ${response.json()}==${expected_json}
    Should Be Equal As Strings           ${response.status_code}         200

