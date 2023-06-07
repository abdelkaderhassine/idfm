*** Settings ***
Documentation     Common Android keywords
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Library            DateTime
Resource          ${EXECDIR}/PageObjects/common.resource
*** Keywords ***
Chercher Un Itinéraire
    [Arguments]    ${destination_arrivée}    ${point_de_départ}
    Click By Text    Rechercher un itinéraire
    Search And Select Destination    ${destination_arrivée}
    Search And Select Destination    ${point_de_départ}
    Wait Until Page Contains Element   ${ri_btn_inverserDepartArrivee}    ${short_wait}
    
Refresh Data By Scroll
    Scroll Up By Percentage    65    95

Refresh Data By Click On Rafraichir
    Click By Text    Rafraichir

Verifier Le Refresh Data
    Wait Until Page Contains     ${ri_blc_rootResult}    ${short_wait}

Verifier Bouton Partir -10 min est Grisé
    ${attribut}=    Get Element Attribute    ${ri_btn_partirPlusTot}    enabled
    Should Be True    '${attribut}'=='false'

Verifier Bouton Partir -10 min N'est Plus Grisé
    ${attribut}=    Get Element Attribute    ${ri_btn_partirPlusTot}    enabled
    Should Be True    '${attribut}'=='true'

Verifier Affichage Heure Départ +10 Min
    ${timeAfter10Min}=    Current Time Plus 10 Min    "%Hh%M"
    Element Should Contain Text    ${ri_inp_heure}    ${timeAfter10Min}

Extract Data List
    @{allContent_list}=    Create List
    Wait Until Element Is Visible    ${ri_blc_rootResult}    ${normal_wait}    Aucun résultat n'a été affiché 
    ${numberOfResult}=    Get Matching Xpath Count    ${ri_blc_rootResult}
    Capture Page Screenshot    numberOfResultDisplayed.png
    FOR    ${counter}    IN RANGE    1    ${numberOfResult}+1
        ${counterString}=    Convert To String    ${counter}
        ${locator}=    Replace String    ${ri_blc_loop_rootResult}    xxxx    ${counterString}
        ${content-desc}=    Get Element Attribute    ${locator}    content-desc
        Append To List    ${allContent_list}    ${content-desc}
    END
    RETURN    ${allContent_list}

Verifier Heure Depart Des Resultats Sont Correctes
    ${rootresult_content}=    Extract Data List
    ${departure_time}=     Extract Departure Times    ${rootresult_content}
    ${timeAfter10Min}=    Current Time Plus 10 Min   "%H:%M" 
    ${list_length}=    Get Length    ${departure_time}
    FOR    ${counter}    IN RANGE    ${list_length}
        ${time_comparison}=    Compare Time Strings    ${departure_time}[${counter}]    ${timeAfter10Min}
        Should Be True    ${time_comparison} > 0
    END
    

Compare Time Strings
    [Arguments]    ${time1}    ${time2}
    ${time1_obj}=    Convert Time    ${time1}
    ${time2_obj}=    Convert Time    ${time2}
    ${time_comparison}=    Evaluate    ${time1_obj}-${time2_obj}
    [Return]    ${time_comparison}
    