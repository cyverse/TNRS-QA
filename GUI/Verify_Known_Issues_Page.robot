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
    Click Element    link=Known Issues
    Wait Until Page Contains    10% of names marked

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

Verify Known Issues title element
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=a#Known_Issues

Verify Case sensitive text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Case sensitive

Verify First paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    The GNI Parser is case sensitive with regards to certain infraspecific rank indicators. For example, submission of "VAR." may result in being treated as part of an author name or will not be recognized at all. If you are using the parse only functionality, you will notice this in the details for a submitted name. To prevent this, we suggest you convert your infraspecific epithets to lower case characters. In this case, "VAR." should be "var.".

Verify Family name suffixes text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Family name suffixes

Verify Family name suffixes paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Family names submitted without -aceae will not be handled by the TNRS. Please ensure submitted family names have the appropriate suffixes.

Verify Underscores text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Underscores

Verify Underscores paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Underscores in submitted names are stripped to allow parsing of the names which have been prepared for use in applications that prohibit spaces, such as Phylocom. If you have an underscore that is intended to be part of the submitted name, your results may be returned incorrectly (for example, an accession number such as "Smith_5644" or a morphospecies name such as "Lauraceae gen_indet._1").

Verify Submitted name not matching name in results text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Submitted name not matching name in results

Verify Submitted name first paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Some of the submitted names displayed in your TNRS results, returned in the download file, or via the TNRS API may not match back to your original file or database of names. This is because the TNRS removes leading and trailing white spaces, changes underscores to whitespace, and converts characters such as quotation marks which may cause problems with our application. Submitted names which fail to match can be difficult to spot and may prevent you from programmatically joining your TNRS results back to your original database. We are working on a fix which will return the verbatim name submitted. In the meantime, if you find that some of the results are not matching to your original names, we suggest you use an integer to uniquely identify each name in your original database. You should include this identifier with each name that you submit to the TNRS. The identifier must appear in front of each name, followed by a tab, as follows:

Verify Submitted name second paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    1 < tab > name

Verify Submitted name third paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    2 < tab > anothername

Verify Submitted name fourth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    3 < tab > yetanothername

Verify Submitted name fifth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Name lists that include an identifier must be submitted as a text file using the TNRS file upload utility. Be sure to check the box "my file contains an identifier as first column".

Verify Abbreviation "f." may prevent matching text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Abbreviation "f." may prevent matching

Verify Abbreviation first paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    In some cases, embedded parent taxon authors followed by "f." (either in the sense of "filius" or as the abbreviation for rank indicator "forma") prevent matching to infraspecific taxon. For example, the names "Achillea millefolium L. f. rosea Rand. & Redf." and "Amelanchier arborea Michx. f. var. laevis (Wiegand) Ahles" match incorrectly. This problem is due in part to the parser confusing "f." for "filius" ("son of", after an author's name) and "f." for "forma", a rank indicator.

Verify Capitalized epithets prevent fuzzy matching text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Capitalized epithets prevent fuzzy matching

Verify Capitalized first paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    "Acer Rubrum Linnaeus" resolves only to genus "Acer", whereas "Acer rubrum Linnaeus" resolves fully to "Acer rubrum L.". This is because misspelled names are parsed prior to fuzzy matching, and the parser uses capitalization to detect and classify the parts of a name. "Rubrum" in "Acer Rubrum Linnaeus" is detected as an author name rather than an epithet. Until we find a solution for this problem, please ensure that all epithets (specific, subspecific, varietal, etc.) begin with lowercase letters.

Verify Hybrids can not be fuzzy matched text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Hybrids can not be fuzzy matched

Verify Hybrids first paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Currently, hybrid names not matching exactly to names in our database will not be resolved. For example, both "Aesculus x neglecta" and "Aesculus x neglecta Lindl." resolve to "Aesculus x neglecta Lindl." in the TNRS database. However, none of the following incorrect or variant spellings are resolved: "Aesculus x neglecta Lindley", "Esculus x neglecta", "Aesculus neglecta".

Verify 10% of names marked text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    10% of names marked 'species' in NCBI are not taxonomic

Verify 10% first paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    More than 10% of the names marked as 'species' in NCBI are not taxonomic names but in fact informal accession numbers or pointers to specimens.

Verify 10% second paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Examples of such names include:

Verify 10% third paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Eichhornia sp. Barret and Shore 1399

Verify 10% fourth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Chusqea sp. 'LC et al. 1309'

Verify 10% fifth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Teloschistes cf. chrysophthalmus Feige and Mies ESS 6640

Verify 10% sixth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Quercus petraea/Quercus robur mixed clone library

Verify 10% seventh paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    unidentified symbiotic dinoflagellate from Spongostaurus sp.

Verify 10% eighth paragraph text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    These names are provided for completeness in representing the content of the NCBI names database. However, they do not conform to the ICBN (International Code of Botanical Nomenclature) and should not be regarded as taxonomically valid or legitimate plant names.
