*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              /n https://e-3d-jira2.capgemini.com/jira2/browse/P002593-3825
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/rechercheitineraires.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- Verifier Bouton -10 Min Est Grisé Par Defaut
    Start The Application
    Chercher Un Itinéraire    La Défense    Goncourt  
    Verifier Bouton Partir -10 min est Grisé
    Click By Text    +10 min
    Verifier Bouton Partir -10 min N'est Plus Grisé

TC02- Verifier Affichage Du Heure Départ Après Click +10 Min
    Start The Application
    Chercher Un Itinéraire    La Défense    Goncourt
    Click By Text    +10 min
    Verifier Affichage Heure Départ +10 Min

TC03- Partir Après 10 Min - Verifier Les Heures Du Départ
    Start The Application
    Chercher Un Itinéraire    La Défense    Goncourt
    Click By Text    +10 min
    Verifier Heure Depart Des Resultats Sont Correctes
    