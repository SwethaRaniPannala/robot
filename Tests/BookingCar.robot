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
    Login into the site with valid credentials

User can select the date for the trip
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 3
    Go to Web Page
    Login into the site with valid credentials
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
    # ${LINK_TEXT}                                      Get Title
    # Should Be Equal                                   ${LINK_TEXT}     Infotiv Car Rental
      Wait until Page Contains                           Infotiv Car Rental

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
     Click Button                                        id:login
Verify login Completed
      [Arguments]                                      ${WELCOMEPHRASE_TERM}        ${ACTUAL_TERM}
     Wait until Page Contains Element                  xpath://*[@id="welcomePhrase"]
     ${ACTUAL_TERM}                                    Get Text     xpath://*[@id="welcomePhrase"]
     Should Be Equal                                   "${WELCOMEPHRASE_TERM}"       "${ACTUAL_TERM}"
                                                       #id:welcomePhrase

                                                      # Logout Button
                                                       #My page Button


Dates accepted to continue for car selection
   Enter start and end date
   Submit Dates selected
   Verify Date selected/accepted
Enter start and end date
       Input Text                                      id:start     ${START_DATE}
       Input Text                                      id:end       ${END_DATE}
       Set selenium speed                              0.25
Submit Dates selected
       Click Button                                      xpath://*[@id="continue"]        Continue
Verify Date selected/accepted
       Wait Until page contains Element                id:questionText

End Web Test
       Close Browser





***Total flow***
confirm booking
       [Documentation]    This is some basic  info about the whole test suite
       [Tags]             Test 3
       Open browser                              about:blank       chrome
       Go to                                     http://rental31.infotiv.net/
       Input Text                                id:email      swetha.rani.pannala@iths.se
       Input Text                                id:password       tester2020
       Click Button                              xpath://*[@id="login"]
       Element Text Should Be                    xpath://*[@id="welcomePhrase"]     You are signed in as Rani
       set selenium speed                        .25
       Input Text                                id:start       ${START_DATE}
       Input Text                                id:end     ${END_DATE}
       Sleep                                     1second

       Click Button                              xpath://*[@id="continue"]
       Element Text Should Be                    xpath://*[@id="questionText"]      What would you like to drive?
Search for specified car
     Select Required Car
       Click Button                              xpath://*[@id="ms-list-1"]/button
       Select Checkbox                           ${CAR_NAME}
       Click Button                              xpath://*[@id="ms-list-2"]/button

       Select Checkbox                           ${PASSENGERS_NUMBER}

     Submit selected Car
         Click Element                              id=leftpane

     Verify Car Search Completed
         Wait Until Page Contains                   id:carSelection
#again press seat number
       #Click Button                              xpath://*[@id="ms-list-2"]/button
Booking Process
Selcting the car
        Click Button                                id=carSelect1
filling personal details

       Input Text                                   id:cardNum      ${CARD_NUMBER}
       Input Text                                   id:fullName     ${CARDHOLDER_NAME}
       Click element                                xpath://*[@id="confirmSelection"]/form/select[1]
       Click element                                xpath://*[@id="confirmSelection"]/form/select[1]/option[2]
       Click element                                xpath://*[@id="confirmSelection"]/form/select[2]
       Click element                                xpath://*[@id="confirmSelection"]/form/select[2]/option[6]
       Input Text                                   id:cvc      ${CVC_NUMBER}



confirming booking

       Click Button                                id:confirm

 # Verifying the confirmation
  # search term start date  are coming or not
      #Element Text Should Be                    xpath://*[@id="questionText"]      Confirm booking of Audi Q7


#
       Close Browser



