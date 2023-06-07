*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              /n 
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/consentement.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- Naviguer Vers 'Donnez-nous votre avis' - Verifier La Redirection Vers La Bonne Page
    Start The Application
    Click By Text    Mon espace
    Scroll Down Until Element Found    Donnez-nous votre avis
    Click By Text    Donnez-nous votre avis
    Verifier La Redirection    actulab.typeform.com