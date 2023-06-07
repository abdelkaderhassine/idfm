*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              /n 
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/consentement.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- Cliquer Sur Politique De Confidentialité 
    __Launch IDFM App
    Click By Text    politique de confidentialité
    Verifier La Redirection

TC02- Accepter Les Cookies Nécessaires 
    __Launch IDFM App
    Click By Text    J\'accepte les cookies nécessaires
    Verifier Affichage Welcome Screen

TC03- Je Paramètre Mes Choix
    __Launch IDFM App
    Click By Text    Je paramètre mes choix
    Verifier L'affichage De Page Confidentialité
    Proceed To Contiue
    Verifier Affichage Welcome Screen
