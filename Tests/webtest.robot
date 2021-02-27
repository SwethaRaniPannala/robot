*** Settings ***
Documentation    This is some basic  info about the whole test suite
Library          SeleniumLibrary

*** Test Cases ***
User can access website
   [Documentation]            This is some basic  info about the whole test suite
   [Tags]                     Test 1
   Open browser               about:blank       chrome
   Go to                      https://www.willys.se/
   Wait until Page Contains   Handla billig mat online
   Input Text                 selenium--search-items-input  kiwi
   Press Keys                 xpath://*[@id="selenium--search-items-input"]  RETURN
   Wait until Page Contains   Sökord: kiwi
   Close browser

