*** Settings ***
Documentation    This is some basic  info about the whole test suite
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***

${BROWSER}       chrome
${URL}           https://www.willys.se/
${SEARCH TERM}   kiwi

*** Keywords ***

Begin Web Test
     Open browser               about:blank       ${BROWSER}

Go to Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                      ${URL}
Verify Page Loaded
     Wait until Page Contains   Handla billig mat online
Search for Product
     Enter Search Term
     Subit Search
     Verify Search Completed
Enter Search Term
     Input Text                 id:selenium--search-items-input    ${SEARCH TERM}
Subit Search
     Press Keys                 xpath://input[@id="selenium--search-items-input"]       RETURN
     Press Keys                 xpath://input[@id="selenium--search-items-input"]      RETURN
Verify Search Completed
     Wait until Page Contains   Sökord: kiwi

End Web Test
     Close Browser

*** Test Cases ***
User can access website
   [Documentation]            This is some basic  info about the whole test suite
   [Tags]                     Test 1
    Go to Web Page
User can search for a product
   [Documentation]            This is some basic  info about the whole test suite
   [Tags]                     Test 2
    Go to Web Page
    Search for Product




