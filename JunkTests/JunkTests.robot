*** Test Cases ***
Complex Testcase
    Log    ${Var_A}
    Log    ${Var_B}
    Run Keyword If    "${Var_A}" == "Blah" and "${Var_B}" == "Boo"    Set Test Variable    ${TestVar}    Matched Blah AND Boo
    Run Keyword If    "${Var_A}" == "BlahBlah" and "${Var_B}" == "BooHoo"    Set Test Variable    ${TestVar}    Matched BlahBlah
    Run Keyword If    "${Var_A}" == "BlahBlahBlah" and "${Var_B}" == "BooHooHoo"    Set Test Variable    ${TestVar}    Matched BlahBlahBlah
