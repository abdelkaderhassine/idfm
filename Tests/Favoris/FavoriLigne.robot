*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              \n P002593/Affichage+du+favori
...              \n P002593/Nommer+un+favori
...              \n P002593/Renommer+le+favori
...              \n P002593/Popup+confirmation+ajout+du+favori
...              \n P002593/Popup+confirmation+modification+du+favori \n
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/favoris.resource
Resource    ${EXECDIR}/PageObjects/horaires.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- 
    Start The Application
    Select Menu Option    Horaires
    Select Transport Option On Horaires Screen    metro
    #Swipe By Percent    50    20    50    50
    Click By Text    Métro 2
    Click By Text    Nation
    Click On    ${hrr_ico_addToFavorite}
    Click On    ${btn_retourToHomePage}
    Click On    ${btn_retourToHomePage}
    Navigate To Favoris
    Click By Text    Lignes
    Wait Until Page Contains    Métro 2
    
TC02- 
    Start The Application
    Select Menu Option    Horaires
    Click By Text    RER A
    Click By Text    Gare de départ
    Click By Text    Auber
    Click By Text    Gare d'arrivée
    Click By Text    Cergy le Haut
    Click By Text    Rechercher
    Click On    ${hrr_ico_addToFavorite}

    Click On    ${btn_retourToHomePage}
    Click On    ${btn_retourToHomePage}
    Navigate To Favoris

    Click By Text    Lignes
    Wait Until Page Contains    RER A
    
TC03- 
    Start The Application
    Select Menu Option    Horaires
    Click By Text    RER A
    Click By Text    Gare de départ
    Click By Text    Auber
    Click By Text    Gare d'arrivée
    Click By Text    Cergy le Haut
    Click By Text    Rechercher
    Click On    ${hrr_ico_addToFavorite}

    Click On    ${btn_retourToHomePage}
    Click On    ${btn_retourToHomePage}
    Navigate To Favoris

    Click By Text    Lignes
    Wait Until Page Contains    Lundi à Vendredi
    Click By Text    Alertes
    Wait Until Page Contains    De 06:30 à 09:30
    Wait Until Page Contains    De 16:30 à 19:30
    
    Click By Text    Ajouter une plage horaire
    Click By Text    12
    Click By Text    OK
    Click By Text    14
    Click By Text    OK

    Click On    ${btn_retourToHomePage}

    Wait Until Page Contains    Tous les jours

    Click By Text    Alertes
    
    