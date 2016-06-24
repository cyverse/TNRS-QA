*** Variables ***
${Browser}        ff
${BrowserAlias}    MainTNRS
${GUIWaitLong}    45s
${GUIWaitShort}    10s
${SShotBase}      selenium-screenshot
${SShotCount}     0
${TNRSHost}       host.fqdn.org
${TNRSVer}        1.0.1

*** Keywords ***
TNRS Run On Failure
    Log Source
    Comment    ${SShotCount} =    Set Variable    ${SShotCount}+1
    Comment    Set Global Variable    ${SShotCount}    ${SShotCount + 1}
    ${SShotCount} =    Evaluate    ${SShotCount} + 1
    Set Global Variable    ${SShotCount}
    Capture Page Screenshot    ${SShotBase}-${SShotCount}.png
