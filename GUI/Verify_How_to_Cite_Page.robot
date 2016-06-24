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
    Click Element    link=How to Cite
    Wait Until Page Contains    How to Cite the Taxonomic Name Resolution Service v${TNRSVer}

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

Verify How to Cite title text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    How to Cite the Taxonomic Name Resolution Service v${TNRSVer}

Verify First paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    To cite the Taxonomic Name Resolution Service please refer to the following publication:

Verify Second paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    Boyle, B. et.al. The taxonomic name resolution service: an online tool for automated standardization of plant names. BMC Bioinformatics. 2013, 14:16. doi:10.1186/1471-2105-14-16
    Comment    Page Should Contain    Boyle, B. et.al.
    Page Should Contain    Boyle, B. et al.
    Page Should Contain    The taxonomic name resolution service: an online tool for automated standardization of plant names.
    Comment    Page Should Contain    BMC Bioinformatics. 2013, 14:16.
    Page Should Contain    BMC Bioinformatics 14:16.

Verify exact:doi link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    Boyle, B. et.al. The taxonomic name resolution service: an online tool for automated standardization of plant names. BMC Bioinformatics. 2013, 14:16. doi:10.1186/1471-2105-14-16
    Comment    Page Should Contain Element    link=exact:doi:10.1186/1471-2105-14-16
    Page Should Contain Element    //a[contains(text(),'doi:10.1186/1471-2105-14-16')]

Verify Third paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    If the results derived from the TNRS are used in a publication, please cite:

Verify Fourth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    The Taxonomic Name Resolution Service. iPlant Collaborative. Version < VERSION NUMBER > accessed on < DATE ACCESSED >. Available at http://tnrs.iplantcollaborative.org.
    Comment    Page Should Contain    The Taxonomic Name Resolution Service. iPlant Collaborative. Version < VERSION NUMBER > accessed on < DATE ACCESSED >. Available at${SPACE * 2}http://tnrs.iplantcollaborative.org.
    Page Should Contain    The Taxonomic Name Resolution Service [Internet]. iPlant Collaborative. Version < VERSION NUMBER > [Accessed: ]. Available from: http://tnrs.iplantcollaborative.org.

Verify Fifth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    For example:

Verify Sixth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    The Taxonomic Name Resolution Service [Internet]. iPlant Collaborative. Version ${TNRSVer} [Accessed: 28 Aug 2015]. Available from: http://tnrs.iplantcollaborative.org

Verify Seventh paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    Substantial effort has gone into producing reliable taxonomic lists. We request that if you use the TNRS that you also acknowledge the original authors and editors of the lists that have been used as sources. See: Sources.
    Page Should Contain    Finally, we also request that you acknowledge separately all taxonomic data sources used by the TNRS to process your data. Acknowledge only the sources you selected. Taxonomic sources should be cited as shown below. Note that the "Accessed" date is the date of the latest update of that source within the TNRS database, as noted on the Sources page of this website.

Verify Eighth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Tropicos.org [Internet]. Missouri Botanical Garden, St. Louis, MO, USA. [Accessed 19 Dec 2014]. Available from: http://www.tropicos.org

Verify Nineth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    USDA, NRCS. The PLANTS Database [Internet]. National Plant Data Team, Greensboro, NC, USA. [Accessed: 17 Jan 2015]. Available from: http://plants.usda.gov

Verify Tenth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Flann, C, editor. Global Compositae Checklist [Internet]. 2009 - [Accessed: 21 Aug 2015]. Available from: www.compositae.org/checklist

Verify Eleventh paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Federhen S. The Taxonomy Project. 9 Oct 2002 [Updated 13 Aug 2003]. In: McEntyre J., Ostell J., editors. The NCBI Handbook [Internet]. National Center for Biotechnology Information, Bethesda, MD, USA. [Accessed: 25 Oct 2011]. Available from: http://www.ncbi.nlm.nih.gov/guide/taxonomy/

Verify Twelveth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    The Plant List (2013). Version 1.1. Published on the Internet; http://www.theplantlist.org/ [Accessed: 19 Aug 2015].

Verify Thirteenth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    International Legume Database and Information Service, http://www.ildis.org/ [Accessed: 21 Aug 2015].
