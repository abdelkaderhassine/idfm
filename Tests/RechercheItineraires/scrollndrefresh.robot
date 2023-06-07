*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              /n P002593-3825
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/rechercheitineraires.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- Scroll To Refresh Data - Screen 'Transport Publique'
    Start The Application
    Chercher Un Itinéraire    La Défense    Goncourt  
    Refresh Data By Scroll
    Verifier Le Refresh Data

TC02- Click On Refresh Button - Screen 'Transport Publique'
    Start The Application
    Chercher Un Itinéraire    La Défense    Goncourt  
    Refresh Data By Click On Rafraichir
    Verifier Le Refresh Data