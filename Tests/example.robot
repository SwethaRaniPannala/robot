*** Settings ***
Documentation    This is some basic  info about the whole test suite
Library          SeleniumLibrary

*** Test Cases ***

user can login
       [Documentation]    This is some basic  info about the whole test suite
       [Tags]             Test 3
       Open browser                              about:blank       chrome
       Go to                                     http://rental31.infotiv.net/
       #set selenium speed                        2seconds
       Input Text                                id:email      swetha.rani.pannala@iths.se
       Input Text                                id:password       tester2020
       Click Button                              xpath://*[@id="login"]
       Element Text Should Be                    xpath://*[@id="welcomePhrase"]     You are signed in as Rani
       Element Should Be Visible                 id:logout
       Element Should Be Visible                 id:mypage
       Close Browser

Date Selection
       [Documentation]    This is some basic  info about the whole test suite
       [Tags]             Test 2
       Open browser                              about:blank       chrome
       Go to                                     http://rental31.infotiv.net/
       Input Text                                id:email      swetha.rani.pannala@iths.se
       Input Text                                id:password       tester2020
       Click Button                              xpath://*[@id="login"]
       Element Text Should Be                    xpath://*[@id="welcomePhrase"]     You are signed in as Rani
       set selenium speed                        .25
       Input Text                                id:start       03-06
       Input Text                                id:end         03-06
       Sleep                                     1second
       Click Button                              xpath://*[@id="continue"]
       Element Text Should Be                    xpath://*[@id="questionText"]      What would you like to drive?
       Close Browser

Confirm car booking
       [Documentation]    This is some basic  info about the whole test suite
       [Tags]             Test 3
       Open browser                              about:blank       chrome
       Go to                                     http://rental31.infotiv.net/
       Input Text                                id:email      swetha.rani.pannala@iths.se
       Input Text                                id:password       tester2020
       Click Button                              xpath://*[@id="login"]
       Element Text Should Be                    xpath://*[@id="welcomePhrase"]     You are signed in as Rani
       set selenium speed                        .25
       Input Text                                id:start       03-06
       Input Text                                id:end         03-06
       Sleep                                     1second
       Click Button                              xpath://*[@id="continue"]
       Element Text Should Be                    xpath://*[@id="questionText"]      What would you like to drive?
       Click Button                              xpath://*[@id="ms-list-1"]/button
       Select Checkbox                           Audi
       Click Button                              xpath://*[@id="ms-list-2"]/button

       Select Checkbox                           5
#again press seat number
       #Click Button                              xpath://*[@id="ms-list-2"]/button


       Click Element                              id=leftpane


       Click Element                             id=carSelect1

       #Element Text Should Be                    xpath://*[@id="questionText"]      Confirm booking of Audi Q7
       Input Text                                id:cardNum     8783919167171213
       Input Text                                id:fullName    Swetha rani p
       click element                             xpath://*[@id="confirmSelection"]/form/select[1]
       click element                             xpath://*[@id="confirmSelection"]/form/select[1]/option[2]
       click element                             xpath://*[@id="confirmSelection"]/form/select[2]
       click element                             xpath://*[@id="confirmSelection"]/form/select[2]/option[6]

       Input Text                                id:cvc     123
       Click Button                              id:confirm
#
      # Wait Until Page Contains Element          id:questionTextSmall       A Audi Q7 is now ready for pickup 2021-03-02
       Close Browser







