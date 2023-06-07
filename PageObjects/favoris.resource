*** Settings ***
Documentation     Common Android keywords
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Resource          ${EXECDIR}/PageObjects/common.resource
Variables         ${EXECDIR}/PageObjects/Locators/${platformName}/favori.py
*** Keywords ***

Navigate To Favoris
    Select Menu Option    Mon espace
    Click By Text    Mes favoris
    Wait Until Page Contains    Ajouter un lieu favori    ${short_wait}

Renseigner Adresse Favori
    [Arguments]    ${adresse_exact}
    Click On    ${fav_inp_adresseSearchBar}
    Input Text Into Field    ${inp_searchEditText}    ${adresse_exact}
    ${locator}=    Replace String    ${iti_txt_optionListRI}    xxxx    ${adresse_exact}
    Click On    ${locator}

Nommer Un Favori
    [Documentation]    Par défault, le nom du favori est l'adresse choisi
    [Arguments]    ${favori_name}=${None}
    IF    '${favori_name}'!='${None}'
        Input Text Into Field    ${inp_nommerEditText}    ${favori_name}
    END
    Click Text    Valider


Select Option From More Option Menu
    [Documentation]    Options are 'Renommer', 'Supprimer', 
    [Arguments]    ${destination}    ${option}
    ${moreOptionLocator}=    Replace String    ${btn_moreOptions}    xxxx    ${destination}
    Click On    ${moreOptionLocator}
    Click By Text    ${option}

Confirmer Popup Favori Ajoutée
    Wait Until Page Contains    Adresse ajoutée à vos favoris !    ${short_wait}
    Wait Until Page Contains    Vos favoris sont sur la page d’accueil et vos adresses sont visibles dans la recherche de lieux.    ${short_wait}
    Click By Text    	FERMER

Select Favori Type
    [Documentation]    Types de favoris sont: Maison, Travail
    ...                Par défaut le type de favori est 'Autre'
    [Arguments]    ${type_favori}=Autre
    IF    '${type_favori}' != 'Autre'
        Click On    ${fav_ico_favori${type_favori}}
    END

Ajouter Un Favori Lieu
    [Documentation]    Le type de favori est 'Autre' par défault. It can be overrided to 'Maison' or 'Travail'
    ...                Le nom du favori est renseigné par défault par l'app
    [Arguments]    ${type_favori}='Autre'    ${adresse}='default'         ${favori_name}=${None}
    Click By Text    Ajouter un lieu favori
    Select Favori Type    ${type_favori}
    IF    ${adresse} != 'default'
        Renseigner Adresse Favori    ${favori_name}
    END
    Click By Text    Enregistrer ce favori    exact\_match=False
    IF    '${type_favori}' == 'Autre'
        Nommer Un Favori    ${favori_name}
    END
    Confirmer Popup Favori Ajoutée
    
Return To homepage
    Click On    ${btn_retourToHomePage}
    Select Menu Option    Itinéraires

Verifier L'affichage D'un Favori
    [Documentation]
    [Arguments]    ${adresse}    ${Complément_adresse}=${None}
    Wait Until Page Contains    ${adresse}    ${short_wait}
    Wait Until Page Contains    ${Complément_adresse}    ${short_wait}

Click On Favorite Icon
    [Documentation]    Cliquer sur l'icone favori qui s'affiche sur le popup d'un position autour de moi
    Click On    ${ico_addAsFavoriteButton}