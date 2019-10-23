** Settings ***
Documentation     A test suite testing related to invalid login and location
...
...        
...
Suite Setup       Open Browser To Main Page
Suite Teardown    Close Browser 
#Test Template     Login Credentials Should Fail
Resource          resource.robot




*** Test Cases ***       USERNAME         PASSWORD
# Invalid UserAndPass      ${INVALID USER}  ${INVALID PASSWORD}    
# Empty Username           ${VOID}          ${INVALID PASSWORD}
# Empty Password           ${INVALID USER}  ${VOID}  

Seach Cities Successful
      Given open browser to main page
      When location input is "Joensuu"
      Then search location successful

Search Cities Unsuccessful
       Given open browser to main page
       When location input is "city"
       Then search location unsuccessful


*** Keywords ***

Location Input Is "${location}"
    Input Text Into Location Finder  "${location}"
    Submit Search
    Search Location Successful

Login Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Move To Login
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Page Should Contain Tunnus tai salasana on väärin
