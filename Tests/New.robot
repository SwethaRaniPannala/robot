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
${START_DATE}                                      03-12
${END_DATE}                                        03_12
${CAR_NAME}                                        Audi

${PASSENGERS_NUMBER}                               2
${CARD_NUMBER}                                     8783919167171213
${CARDHOLDER_NAME}                                 Swetha rani p
${CVC_NUMBER}                                      123


*** Test Cases ***
User can login into the infotiv car rental site
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 1
   Go to Web Page
   Login into the site
#    Given Go to Web Page
#    When Enter Valid Login Credentials
#    And Submit Login Credentials
#    Then Verify login Completed

User can select the date for the trip
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            Test 2
    Given Go to Web Page
    When Enter Valid Login Credentials
    And Submit Login Credentials
    And Verify login Completed
    And Enter start and end date
    And Submit Dates selected
    Then Verify Date selected/accepted

#    Given I have entered valid start and end dates
#    When  I click or press on continue button

#    then entered dates should be accepted with


User book car for a trip
   [Documentation]                                   This is some basic  info about the whole test suite
   [Tags]                                            VG_test
    Given Go to Web Page
    When Enter Valid Login Credentials
    And Submit Login Credentials
    And Verify login Completed
    And Enter start and end date
    And Submit Dates selected
    And Verify Date selected/accepted
    And Select Required Car
    And Submit selected Car
    And Verify Car Search Completed
    And Book the car
    And filling personal details
    Then Car booking



*** Keywords ***


Begin Web Test
     Open browser                                  about:blank       ${BROWSER}

Go to Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                         ${URL}
Verify Page Loaded
    Wait until Page Contains                       Infotiv Car Rental

Login into the site
     Enter Valid Login Credentials
     Submit Login Credentials
     Verify Login Completed
Enter Valid Login Credentials
     Input Text                                    id:email     ${VALID USERNAME}
     Input Text                                    id:password      ${VALID PASSWORD}
Submit Login Credentials
     Press Keys                                    id:login     Login
Verify login Completed
     Wait until Page Contains Element              id:welcomePhrase
Dates accepted to continue for car selection
   Enter start and end date
   Submit Dates selected
   Verify Date selected/accepted
Enter start and end date
    Input Text                                     id:start     ${START_DATE}
    Input Text                                     id:end       ${END_DATE}
    Set selenium speed                             0.25
Submit Dates selected
    Press Keys                                     xpath://*[@id="continue"]        Continue
Verify Date selected/accepted
    Wait Until page contains Element               id:questionText

Search for specified car
    Select Required Car
    Submit selected Car
    Verify Car Search Completed
Select Required Car
    Click Button                                   xpath://*[@id="ms-list-1"]/button
    Select Checkbox                                ${CAR_NAME}
    Click Button                                   xpath://*[@id="ms-list-2"]/button

    Select Checkbox                                ${PASSENGERS_NUMBER}

Submit selected Car
    Click Element                                  id=leftpane
    Sleep                                          .25

Verify Car Search Completed
    Wait Until Page Contains Element                id:carSelection

Booking Process
    Book the car
    filling personal details
    Car booking
    #Verifying the Car booking confirmation
Book the car
    Click Button                                    id=carSelect1
filling personal details

    Input Text                                       id:cardNum      ${CARD_NUMBER}
    Input Text                                       id:fullName     ${CARDHOLDER_NAME}
    Click element                                    xpath://*[@id="confirmSelection"]/form/select[1]
    Click element                                    xpath://*[@id="confirmSelection"]/form/select[1]/option[2]
    Click element                                    xpath://*[@id="confirmSelection"]/form/select[2]
    Click element                                    xpath://*[@id="confirmSelection"]/form/select[2]/option[6]
    Input Text                                       id:cvc      ${CVC_NUMBER}

Car booking
    Click Button                                     id:confirm

#Verifying the Car booking confirmation

    #Wait Until Page Contains                         xpath://*[@id="questionText"]      Confirm booking

End Web Test
    Close Browser