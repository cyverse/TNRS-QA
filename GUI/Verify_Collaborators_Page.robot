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
    Click Element    link=Collaborators
    Wait Until Page Contains    Funding provided by the

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

Verify Collaborators title text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    css=div:contains("Collaborators")    ${GUIWaitShort}
    Page Should Contain Element    css=#contentwrapper>div>div>h1
    Comment    Page Should Contain Element    h1:contains(Collaborators)
    Page Should Contain    Collaborators

Verify First paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    TNRS is a project coordinated and developed by the iPlant Collaborative. The Taxonomic Name Resolution Service was built in collaboration with the following institutions:

Verify NCEAS link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The National Center for Ecological Analysis and Synthesis

Verify BIEN link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The Botanical Information and Ecology Network

Verify UofA link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The University of Arizona

Verify CSHL link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Cold Spring Harbor Laboratory

Verify CSIRO link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The Commonwealth Scientific and Industrial Research Organization

Verify GNI link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The Global Names Index

Verify Missouri Botanical Garden link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=The Missouri Botanical Garden

Verify Yale University link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=Yale University

Verify Funding text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Funding provided by the

Verify NSF link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    link=National Science Foundation
