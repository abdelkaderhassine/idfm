*** Settings ***
Documentation     Common Android keywords
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Resource          ${EXECDIR}/PageObjects/common.resource
Variables         ${EXECDIR}/PageObjects/Locators/${platformName}/horaires.py
*** Keywords ***
Select Transport Option On Horaires Screen
    [Documentation]    Options are: favoris, rer, metro, tram, bus
    [Arguments]    ${options}
    Click On    ${hrr_ico_${options}}
    

