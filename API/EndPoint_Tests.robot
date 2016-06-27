*** Settings ***
Resource          ../TNRS_Resources.robot
Library           OperatingSystem

*** Test Cases ***
matchNames Retrieve best
    [Tags]    API    smoke
    Comment    Define variables
    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=best&names=zea%20mays,acacia,solanum,saltea" | python -mjson.tool
    Comment    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=best&names=zea%20mays,acacia,solanum,saltea"
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Not Be Equal As Strings    ${output}    ${EMPTY}

matchNames Retrieve all
    [Tags]    API    smoke
    Comment    Define variables
    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=all&names=zea%20mays,acacia,solanum,saltea" | python -mjson.tool
    Comment    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=all&names=zea%20mays,acacia,solanum,saltea"
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Not Be Equal As Strings    ${output}    ${EMPTY}
    Set Suite Variable    ${output}
    Set Suite Variable    ${count}    20

Verify acceptance key value
    [Tags]    API    regression
    Should Contain    ${output}    "acceptance": "No opinion",

Verify acceptedAuthor key value
    [Tags]    API    regression
    Should Contain    ${output}    "acceptedAuthor": "L.",

Verify acceptedName key value
    [Tags]    API    regression
    Should Contain    ${output}    "acceptedName": "Zea mays",

Verify acceptedNameUrl key value
    [Tags]    API    regression
    Should Contain    ${output}    "acceptedNameUrl": "http://www.tropicos.org/Name/25510055",

Verify annotation key value
    [Tags]    API    regression
    Should Contain    ${output}    "annotation": "",

Verify author key value
    [Tags]    API    regression
    Should Contain    ${output}    "author": "",

Verify authorAttributed key value
    [Tags]    API    regression
    Should Contain    ${output}    "authorAttributed": "L.",

Verify authorScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "authorScore": "",

Verify epithet key value
    [Tags]    API    regression
    Should Contain    ${output}    "epithet": "mays",

Verify epithetScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "epithetScore": "1",

Verify family key value
    [Tags]    API    regression
    Should Contain    ${output}    "family": "Poaceae",

Verify familySubmitted key value
    [Tags]    API    regression
    Should Contain    ${output}    "familySubmitted": "",

Verify genus key value
    [Tags]    API    regression
    Should Contain    ${output}    "genus": "Zea",

Verify genusScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "genusScore": "1",

Verify group key value
    [Tags]    API    regression
    Should Contain    ${output}    "group": "0",

Verify infraspecific1Epithet key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific1Epithet": "",

Verify infraspecific1EpithetScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific1EpithetScore": "",

Verify infraspecific1Rank key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific1Rank": "",

Verify infraspecific2Epithet key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific2Epithet": "",

Verify infraspecific2EpithetScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific2EpithetScore": "",

Verify infraspecific2Rank key value
    [Tags]    API    regression
    Should Contain    ${output}    "infraspecific2Rank": "",

Verify matchedFamily key value
    [Tags]    API    regression
    Should Contain    ${output}    "matchedFamily": "",

Verify matchedFamilyScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "matchedFamilyScore": "",

Verify nameScientific key value
    [Tags]    API    regression
    Should Contain    ${output}    "nameScientific": "Zea mays",

Verify nameSubmitted key value
    [Tags]    API    regression
    Should Contain    ${output}    "nameSubmitted": "zea mays",

Verify overall key value
    [Tags]    API    regression
    Should Contain    ${output}    "overall": "1",

Verify scientificScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "scientificScore": "1",

Verify selected key value
    [Tags]    API    regression
    Should Contain    ${output}    "selected": true,

Verify speciesMatched key value
    [Tags]    API    regression
    Should Contain    ${output}    "speciesMatched": "mays",

Verify speciesMatchedScore key value
    [Tags]    API    regression
    Should Contain    ${output}    "speciesMatchedScore": "1",

Verify unmatched key value
    [Tags]    API    regression
    Should Contain    ${output}    "unmatched": "",

Verify url key value
    [Tags]    API    regression
    Should Contain    ${output}    "url": "http://www.tropicos.org/Name/25510055"

Verify acceptance key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "acceptance": "    ${count}

Verify acceptedAuthor key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "acceptedAuthor": "    ${count}

Verify acceptedName key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "acceptedName": "    ${count}

Verify acceptedNameUrl key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "acceptedNameUrl": "    ${count}

Verify annotation key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "annotation": "    ${count}

Verify author key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "author": "    ${count}

Verify authorAttributed key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "authorAttributed": "    ${count}

Verify authorScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "authorScore": "    ${count}

Verify epithet key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "epithet": "    ${count}

Verify epithet key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "epithet": "    ${count}

Verify family key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "family": "    ${count}

Verify familySubmitted key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "familySubmitted": "    ${count}

Verify genus key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "genus": "    ${count}

Verify genusScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "genusScore": "    ${count}

Verify group key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "group": "    ${count}

Verify infraspecific1Epithet key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific1Epithet": "    ${count}

Verify infraspecific1EpithetScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific1EpithetScore": "    ${count}

Verify infraspecific1Rank key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific1Rank": "    ${count}

Verify infraspecific2Epithet key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific2Epithet": "    ${count}

Verify infraspecific2EpithetScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific2EpithetScore": "    ${count}

Verify infraspecific2Rank key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "infraspecific2Rank": "    ${count}

Verify matchedFamily key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "matchedFamily": "    ${count}

Verify matchedFamilyScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "matchedFamilyScore": "    ${count}

Verify nameScientific key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "nameScientific": "    ${count}

Verify nameSubmitted key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "nameSubmitted": "    ${count}

Verify overall key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "overall": "    ${count}

Verify scientificScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "scientificScore": "    ${count}

Verify selected key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "selected":    ${count}

Verify speciesMatched key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "speciesMatched": "    ${count}

Verify speciesMatchedScore key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "speciesMatchedScore": "    ${count}

Verify unmatched key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "unmatched": "    ${count}

Verify url key count
    [Tags]    API    regression
    Should Contain X Times    ${output}    "url": "    ${count}

matchNames missing Retrieve parameter
    [Tags]    API    regression    TNRS-197
    Comment    Define variables
    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?names=zea%20mays,acacia,solanum,saltea" | python -mjson.tool
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Contain    ${output}    Error message about missing retrieve parameter

matchNames missing name parameter
    [Tags]    API    regression    TNRS-197
    Comment    Define variables
    ${output} =    Run    curl -s http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=all
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Not Be Equal As Strings    ${output}    ${EMPTY}
    Should Contain    ${output}    Error message about missing name parameter

matchNames Retrieve parameter is empty
    [Tags]    API    regression    TNRS-197
    Comment    Define variables
    Comment    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=&names=zea%20mays,acacia,solanum,saltea" | python -mjson.tool
    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=&names=zea%20mays,acacia,solanum,saltea"
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Contain    ${output}    Error message about null retrieve parameter

matchNames Name parameter is empty
    [Tags]    API    regression    TNRS-197
    Comment    Define variables
    ${output} =    Run    curl -s "http://${TNRSHost}/tnrsm-svc/matchNames?retrieve=all&name="
    Log    ${output}
    Should Not Contain    ${output}    No JSON object could be decoded
    Should Not Be Equal As Strings    ${output}    ${EMPTY}
    Should Contain    ${output}    Error message about null name parameter
