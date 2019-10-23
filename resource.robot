
*** Settings ***
Documentation           A resource file where higher keywords are defined
Library                 SeleniumLibrary

*** Variables ***
${URL}                  https://www.lupapiste.fi/
${BROWSER}              firefox
${DELAY}                0
${VOID}
${INVALID USER}         invalidUser
${INVALID PASSWORD}     invalidPassword


*** Keywords ***

Open Browser To Main Page
     Open Browser    ${URL}     ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed         ${DELAY}


Move To Login
     Click Link         /kirjaudu

                         
Input Username
      [Argurments]      ${username}
      Input Text        id=login-username    ${username}  
      Click Button      id=next-button
      
Input Password
      [Argurments]      ${password}
      Input Text        id=login-password   ${password}
      

Submit Credentials
       Click Button     id=login-button
     
Input Text Into Location Finder
      [Argurments]       ${WORD}
      Input Text         id=city-search     ${WORD}

Submit Search
       Click Button     id=submit-city-search

Search Location Successful 
       Sleep                            2
       Element Should Be Visible        id=city-result-found

Search Location Unsuccessful
       Sleep                            2
       Element Should Be Visible        class=city-result-notfound


