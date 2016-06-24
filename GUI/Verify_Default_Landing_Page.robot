*** Settings ***
Documentation     This test verifies the default landing page, the associated links, Login screen and the information on the page.
Suite Teardown    Close All Browsers
Test Timeout      1 minute
Resource          ../TNRS_Resources.robot
Library           Selenium2Library    5s    run_on_failure=TNRS Run On Failure

*** Test Cases ***
Open Landing Page
    [Tags]    GUI    smoke
    Comment    Set the default selenium timeout
    Set Selenium Timeout    60s
    Comment    Open Browser and go to site
    Open Browser    http://${TNRSHost}    ${BROWSER}    ${BrowserAlias}
    Comment    Open the browser fullscreen.
    Maximize Browser Window
    Comment    Wait until we see the default landing page
    Wait Until Page Contains Element    link=How to Cite    ${GUIWaitLong}
    Wait Until Page Contains Element    css=img[alt="Try it now!"]    ${GUIWaitLong}

Verify Title text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Taxonomic Name Resolution Service v${TNRSVer}

Verify Home link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Home

Verify TNRS Application link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=TNRS Application

Verify Instructions link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Instructions

Verify Sources link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Sources

Verify About link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=About

Verify Collaborators link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Collaborators

Verify Known Issues link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Known Issues

Verify Optimize Your Search link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Optimize Your Search

Verify How to Cite link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=How to Cite

Verify Welcome text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Welcome to the Taxonomic Name Resolution Service, a free utility for correcting and standardizing plant names.

Verify Try It Now button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=img[alt="Try it now!"]

Verify Quick guide to using the TNRS link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Quick guide to using the TNRS

Verify Read about TNRS in Nature link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Read about TNRS in Nature

Verify Help and Discussion Forum link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Help and Discussion Forum

Verify Join our mailing list link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=img[alt="Join the TNRS Mailing List"]

Verify TNRS on Twitter link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=img[alt="TNRS on Twitter!"]
