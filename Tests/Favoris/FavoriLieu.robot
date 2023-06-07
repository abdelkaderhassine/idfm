*** Settings ***
Documentation    This test suite include following Confluence pages: 
...              /n P002593/Affichage+du+favori
...              /n P002593/Nommer+un+favori
...              /n P002593/Renommer+le+favori
...              /n P002593/Popup+confirmation+ajout+du+favori
...              /n P002593/Popup+confirmation+modification+du+favori
Resource    ${EXECDIR}/PageObjects/common.resource
Resource    ${EXECDIR}/PageObjects/favoris.resource

Test Teardown   Teardown Tests
*** Test Cases ***
TC01- Verifier les bon messages lorsqu'il y a pas des favoris sur l'écran favori lieu
    [Documentation]    
    [Tags]    
    Start The Application
    Navigate To Favoris
    Verifier L'Affichage D'un Text    Vous n'avez aucun favori
    Verifier L'Affichage D'un Text    Effectuez vos recherches d’itinéraire plus facilement en enregistrant vos lieux préférés !

TC02- Affichage d'un lieu favori type 'Maison' sur l'écran Favori, Homepage & RI
    [Documentation]   
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Select Favori Type    Maison
    Click By Text    Enregistrer ce favori
    Confirmer Popup Favori Ajoutée
    Verifier L'affichage D'un Favori    Maison    3 Rue de la Cité, Paris 4e Arrondissement (75004)
    Return To homepage
    Verifier L'affichage D'un Favori    Maison    3 Rue de la Cité, Paris 4e Arrondissement (75004)
    Click By Text    Rechercher un itinéraire
    Verifier L'affichage D'un Favori    Maison    3 Rue de la Cité, Paris 4e Arrondissement (75004)

TC03- Affichage d'un lieu favori type 'Travail' sur l'écran Favori, Homepage & RI
    [Documentation]    
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Select Favori Type    Travail
    Click By Text    Enregistrer ce favori
    Confirmer Popup Favori Ajoutée
    Verifier L'affichage D'un Favori    Travail    3 Rue de la Cité, Paris 4e Arrondissement (75004)
    Return To homepage
    Verifier L'affichage D'un Favori    Travail    3 Rue de la Cité, Paris 4e Arrondissement (75004)
    Click By Text    Rechercher un itinéraire
    Verifier L'affichage D'un Favori    Travail    3 Rue de la Cité, Paris 4e Arrondissement (75004)   
    
TC04- Affichage De L'Adresse Sur Le Popup Nommer Un Favori
    [Documentation]    
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Renseigner Adresse Favori    11 Rue de Milan
    Click By Text    Enregistrer ce favori
    Verifier L'Affichage D'un Text    11 Rue de Milan

TC05- Affichage Du Favori Sans Renommer Depuis L'Ecran Favori
    [Documentation]    P002593/Affichage+du+favori 
    ...                Critère 1
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Renseigner Adresse Favori    11 Rue de Milan
    Click By Text    Enregistrer ce favori
    Click By Text    Valider
    Click By Text    FERMER
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009
    Return To homepage
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009
    Click By Text    Rechercher un itinéraire
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009


TC06- Affichage Du Favori Sans Renommer Depuis L'Ecran Favori
    [Documentation]    P002593/Affichage+du+favori 
    ...                Critère 1
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Renseigner Adresse Favori    11 Rue de Milan
    Click By Text    Enregistrer ce favori
    Click By Text    Valider
    Click By Text    FERMER
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009
    Return To homepage
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009
    Click By Text    Rechercher un itinéraire
    Verifier L'affichage D'un Favori    11 Rue de Milan    75009

TC07- Affichage Du Favori Renommé Ajouté Depuis L'Ecran Favori
    [Documentation]    P002593/Affichage+du+favori 
    ...                Critère 2
    [Tags]    
    Start The Application
    Navigate To Favoris
    Click By Text    Ajouter un lieu favori
    Renseigner Adresse Favori    11 Rue de Milan
    Click By Text    Enregistrer ce favori
    Nommer Un Favori    Maison de Charlie 2
    Click By Text    FERMER
    Verifier L'affichage D'un Favori    Maison de Charlie 2    11 Rue de Milan, Paris
    Return To homepage
    Verifier L'affichage D'un Favori    Maison de Charlie 2    11 Rue de Milan, Paris
    Click By Text    Rechercher un itinéraire
    Verifier L'affichage D'un Favori    Maison de Charlie 2    11 Rue de Milan, Paris

TC08- Affichage Du Favori Renommé Ajouté Depuis RI
    Start The Application
    Click By Text    Rechercher un itinéraire
    Search And Select Destination    11 Rue de Milan
    Select Option From More Option Menu    11 Rue de Milan    Ajouter ce lieu aux favoris
    Nommer Un Favori    Maison de Tom
    Click By Text    FERMER
    Verifier L'affichage D'un Favori    Maison de Tom    11 Rue de Milan
    Return To homepage
    Verifier L'affichage D'un Favori    Maison de Tom    11 Rue de Milan

TC09- Affichage Du Favori Nommé Ajouté Depuis Homepage
    Start The Application
    Click By Text    Rechercher un itinéraire
    Search And Select Destination    11 Rue de Milan
    Return To homepage
    Click By Text    Rechercher un itinéraire
    Select Option From More Option Menu    11 Rue de Milan    Ajouter ce lieu aux favoris
    Nommer Un Favori    Maison de Tom
    Click By Text    FERMER
    Verifier L'affichage D'un Favori    Maison de Tom    11 Rue de Milan
    Return To homepage
    Verifier L'affichage D'un Favori    Maison de Tom    11 Rue de Milan
    Navigate To Favoris
    Verifier L'affichage D'un Favori    Maison de Tom    11 Rue de Milan

#TC10- Affichage Du Favori Nommé Ajouté Depuis Map
#    Start The Application
#    Select Position On Map By Coordinates
#    Click On Favorite Icon
#    Nommer Un Favori    Maison de Tom
#    Click By Text    FERMER
#    Return To homepage
#    Verifier L'affichage D'un Favori    Maison de Tom
#    Navigate To Favoris
#    Verifier L'affichage D'un Favori    Maison de Tom


    