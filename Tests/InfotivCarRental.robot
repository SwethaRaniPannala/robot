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

${SEARCH TERM}

#*** Keywords ***
#
#Begin Web Test
#     Open browser                                   about:blank       ${BROWSER}
#
#Go to Web Page
#     Load Page
#     Verify Page Loaded
#Load Page
#     Go to                                          ${URL}
#Verify Page Loaded
#    Wait until Page Contains                        Infotiv Car Rental
#
#Login into the site
#     Enter Login Credentials
#     Submit Login Credentials
#     Verify Login Completed
#Enter Login Credentials
#     Input Text                                      id:email      swetha.rani.pannala@iths.se
#     Input Text                                      id:password       tester2020
#Submit Login Credentials
##     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
##     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
#     Press Keys                                      xpath://*[@id="login"]     Login
#Verify login Completed
#     Wait until Page Contains                        You are signed in as Rani
#                                                     Logout Button
#                                                     My page Button
#
#End Web Test
#     Close Browser



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

User can select the date for the trip
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 3
    Go to Web Page
    Login into the site
    Dates accepted to continue for car selection

#     Log in with correct password
#      Given I have entered a valid password
#      When I press the login button
#      Then the system should grant me access



#*** Test Cases ***
#    Log in with correct password
#
#     Given I have entered a valid password
#     When I press the login button
#     Then the system should grant me access
#
#I Have Entered A Valid Password
#       Input Password              password s3cr3
#
#When I press the login button
#       Click Elemen                login
#Then the system should grant me access
#       Wait Until Location Contains  myaccount.cgi
#
#       Element Text Should Be greeting Welcome


*** Keywords ***


Begin Web Test
     Open browser                                      about:blank       ${BROWSER}

Go to Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                             ${URL}
Verify Page Loaded
    Wait until Page Contains                           Infotiv Car Rental

Login into the site
     Enter Login Credentials
     Submit Login Credentials
     Verify Login Completed
Enter Login Credentials
     Input Text                                        id:email     ${VALID USERNAME}
     Input Text                                        id:password      ${VALID PASSWORD}
Submit Login Credentials
#     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
#     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
     Press Keys                                        id:login     Login
Verify login Completed
     Wait until Page Contains Element                  id:welcomePhrase
                                                      # Logout Button
                                                       #My page Button


Dates accepted to continue for car selection
   Enter start and end date
   Submit Dates selected
   Verify Date selected/accepted
Enter start and end date
       Input Text                                      id:start       03-03
       Input Text                                      id:end         03-03
       Set selenium speed                              0.25
Submit Dates selected
       Press Keys                                      xpath://*[@id="continue"]        Continue
Verify Date selected/accepted
       Wait Until page contains Element                id:questionText

End Web Test
       Close Browser



