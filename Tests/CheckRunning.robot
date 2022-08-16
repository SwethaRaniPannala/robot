*** Settings ***
Documentation                                      This is some basic  info about the whole test suite
Library                                            SeleniumLibrary
Test Setup                                         Begin Web Test
Test Teardown                                      End Web Test

*** Variables ***

${BROWSER}                                         chrome
${URL}                                             http://rental31.infotiv.net/
${VALID USERNAME}                                  swetha.rani.pannala@iths.se
${VALID PASSWORD}                                  tester2020
${LINK_TEXT}                                       Infotiv Car Rental
${WELCOMEPHRASE_TERM}                              You are signed in as  Rani
${START_DATE}                                      03-01
${END_DATE}                                        03_02
${CAR_NAME}                                        Audi
${PASSENGERS_NUMBER}                               2
${CARD_NUMBER}                                     8783919167171213
${CARDHOLDER_NAME}                                 Swetha rani p
${CVC_NUMBER}                                      123

*** Keywords ***


Begin Web Test
     Open browser                                      about:blank      ${BROWSER}

Go to Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                             ${URL}
Verify Page Loaded
     ${LINK_TEXT}                                      Get Title
     Should Be Equal                                   ${LINK_TEXT}     Infotiv Car Rental

Login into the site with valid credentials
     Enter Login Credentials
     Submit Login Credentials
     Verify Login Completed
Enter Login Credentials
     Input Text                                        id:email     ${VALID USERNAME}
     Input Text                                        id:password      ${VALID PASSWORD}
Submit Login Credentials
#     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
#     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
     Click Button                                        id:login     Login
Verify login Completed
      [Arguments]                                      ${WELCOMEPHRASE_TERM}
     Wait until Page Contains Element                  xpath://*[@id="welcomePhrase"]
     ${ACTUAL_TERM}                                    Get Text     xpath://*[@id="welcomePhrase"]
     Should Be Equal                                   "${WELCOMEPHRASE_TERM}"       "${ACTUAL_TERM}"
                                                       #id:welcomePhrase
End Web Test
       Close Browser
*** Test Cases ***
User can access website
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 1
    Go to Web Page
User can login into the infotiv car rental site
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 2
    Go to Web Page
    Login into the site
