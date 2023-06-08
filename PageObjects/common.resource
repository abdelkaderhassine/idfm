*** Settings ***
Documentation     Common Android keywords
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Library           ${EXECDIR}/utils.py
Variables         ${EXECDIR}/globalsettings.yaml
Variables         ${EXECDIR}/PageObjects/Locators/${platformName}/homepage.py
Variables         ${EXECDIR}/PageObjects/Locators/${platformName}/common.py
Resource          ${EXECDIR}/PageObjects/Devices/${Device_location}.robot
*** Variables ***
${retry_count}=     0
*** Keywords ***
Click On
    [Documentation]    Keyword to click on an element
    [Arguments]    ${element_locator}    ${timeout}=${short_wait}
    Wait Until Page Contains Element    ${element_locator}    ${timeout}
    Click Element  ${element_locator}

Click By Text
    [Arguments]    ${text}    ${timeout}=${short_wait}    ${exact_match}=False
    Wait Until Page Contains    ${text}    ${timeout}
    Click Text    ${text}    exact_match=${exact_match}

Input Text Into Field
    [Arguments]    ${locator}    ${text}    ${timeout}=${short_wait}
    Wait Until Page Contains Element    ${locator}    ${timeout}
    Clear Text    ${locator}
    Input Text    ${locator}    ${text}

Verifier L'Affichage D'un Text
    [Arguments]    ${text}    ${timeout}=${short_wait}
     Wait Until Page Contains   ${text}    ${timeout}

Teardown Tests
    [Documentation]    Keyword for Teardown Tests
    Sleep    ${delay}
    Capture Page Screenshot
    ${Source}=    Get Source
    Log    ${Source}
    Close All Applications

Start The Application
    [Documentation]     This keyword used to opening mobile application using
    ...                 the server url and mobile capabilities
    ...                 and to verifying that it correctly launched
    __Launch IDFM App
    IF        '${platformName}'=='iOS'
        Click By Text    Ne pas autoriser                                #
        Click By Text    Refuser                                         #
    ELSE IF    '${platformName}'=='Android'
            Click By Text    Annuler                                     #refuser la localisation

    END
    

__Launch IDFM App
    Open Application    remote_url=http://127.0.0.1:4723    &{DESIRED_CAPABILITIES_${platformName}}
    #Open Application       remote_url=http://127.0.0.1:4723    platformName=Android    automationName=Uiautomator2   deviceName=RZ8R100309K    appPackage=com.applidium.vianavigo    appActivity=com.applidium.vianavigo.views.MainVianavigo
    IF    '${platformName}'=='Android'
        Run Keyword And Return Status    Click By Text    Ne pas autoriser
    END
    Click By Text    J\'accepte    ${short_wait}    True                #Accepter tous les coockies
    Click By Text    IGNORER                                            #Ignorer welcome screen
    
Select Menu Option
    [Documentation]    Options are 'Itinéraires', 'Achat', 'Mon espace'
    [Arguments]    ${Option}
    ${locator}=     Replace String    ${hmp_btn_mainMenuOptions}    xxxx    ${Option}
    Click On    ${locator}

Verifier La Redirection
    [Arguments]    ${expected_url}=${None}
    Sleep    3s
    ${context}=    Get Contexts
    Should Contain    ${context}[1]    WEBVIEW
    Switch To Context   ${context}[1]
    IF    '${expected_url}'!='${None}'
        ${current_url}=    Get Window Url
        Should Contain     ${current_url}    ${expected_url}
    END
    Capture Page Screenshot


Search And Select Destination
    [Arguments]    ${adresse_exact}
    Input Text Into Field    ${inp_searchEditText}    ${adresse_exact}
    ${locator}=    Replace String    ${iti_txt_optionListRI}    xxxx    ${adresse_exact}
    Click On    ${locator}



Scroll Down Until Element Found
    [Arguments]    ${Text}
    ${element_present}    Run Keyword And Return Status    Page Should Contain Element    ${Text}
    Run Keyword If    '${element_present}' == 'False'    Scroll Page Down And Retry    ${Text}

Scroll Page Down And Retry
    [Arguments]    ${Text}
    Scroll Down By Percentage    60    30
    ${element_present}    Run Keyword And Return Status    Page Should Contain Text    ${Text}
    evaluate     ${retry_count}+1
    Run Keyword Unless    '${element_present}' == 'True'      Scroll Page Down And Retry    ${Text}






###########
Scroll Down By Coordinates
    [Arguments]    ${Y_start}=800  ${Y_end}=200  ${duration}=1000
    ${X_middle} =  Get Window Width
    Swipe    ${X_middle}    ${Y_start}    ${X_middle}    ${Y_end}    ${duration}
    
Scroll Down By Percentage
    [Arguments]    ${Y_start}=80  ${Y_end}=20
    Swipe By Percent    50     ${Y_start}    50    ${Y_end}

Scroll Up By Percentage
    [Arguments]    ${Y_start}=20  ${Y_end}=80
    Swipe By Percent    50     ${Y_start}    50    ${Y_end}

Scroll Down Until Find Element
    [Documentation]    ...
    [Arguments]    ${Element_Locator}
    WHILE    True    limit=10s
     Swipe    500    800    500    300    1000
     Run Keyword And Continue On Failure    Wait Until Page Contains Element    ${Element_Locator}    ${delay}
    END

#######
Click At Coordinates
    [Arguments]    ${x}    ${y}    ${duration}=1000
    @{firstFinger}	create list  ${x}	 ${y}
    @{fingers}    Create List    @{firstFinger}
    Tap With Positions    ${duration}    @{fingers}
    
Select Position On Map By Coordinates
    [Arguments]    ${x}=400   ${y}=600    ${duration}=500
    Click At Coordinates    ${x}    ${y}
    Click At Coordinates    ${x}    ${y}