*** Settings ***
Documentation           These are going to be the tests we are running
Library                 SeleniumLibrary


*** Variables ***
${URL}                  https://www.lupapiste.fi/
${BROWSER}              firefox
${INVALID USER}         invalidUser
${INVALID PASSWORD}     invalidPassword


*** Test Cases ***

# User Can Open Home Page And Reload
#      [Documentation]        Test to see if the user can access the page from
#      ...                    firefox and reload it, then close browser.
#      Open Browser           ${URL}      ${BROWSER}
#      Reload Page
#      [Teardown]             Close Browser

# User Can Move to Login Page
#      Open Browser           ${URL}      ${BROWSER}
#      Click Link             /kirjaudu
#      Page Should Contain    Kirjaudu palveluun
#      [Teardown]             Close Browser
     
# Invalid Login
#      Open Browser           ${URL}      ${BROWSER}
#      Click Link             /kirjaudu
#      Input Username         ${INVALID USER}
#      Input Password         ${INVALID PASSWORD}
#      Login Should Have Failed
#      [Teardown]             Close Browser


User Can Change Language
     Open Browser           ${URL}      ${BROWSER}
     Click Button           class=arrow
     Click Link             https://www.lupapiste.fi/sv/etusivu/
     Page Should Contain    lov?
     [Teardown]             Close Browser

# User Can Search City
#      [documentation]        
#      Open Browser               ${URL}      ${BROWSER}
#      Input Text                 id=city-search  Joensuu
#      Click Button               id=submit-city-search
#      Element Should Be Visible  id=city-result-found


