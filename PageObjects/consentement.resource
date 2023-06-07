*** Settings ***
Documentation     Common Android keywords
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Resource          ${EXECDIR}/PageObjects/common.resource
*** Variables ***
${title}= 	Le respect de votre vie privée
${body}=   	Pour vous offrir une expérience optimale et répondre au mieux à vos besoins, 
...    nous utilisons des outils pour personnaliser le contenu qui vous est proposé. 
...    En cliquant sur "J'accepte" vous acceptez l'utilisation de tous les cookies, comme indiqué dans notre 
...    politique de confidentialité, aussi accessible dans les paramètres depuis le menu. Les données collectées 
...    serviront uniquement à un usage interne à Île-de-France Mobilités, elles ne seront pas partagées à d'autres acteurs.

${btn_acceptAll}=  J'accepte
${btn_acceptNecessary}=  J'accepte les cookies nécessaires 
${btn_selectChoices}=  Je paramètre mes choix

${popup_confidentialité_title}=  Modifications enregistrées
${popup_confidentialité_body}=  Les modifications de vos préférences de confidentialité ont bien été enregistrées.
*** Keywords ***
Verifier L'affichage Du Message Politique De Confidentialité
    Wait Until Page Contains    ${title}    ${short_wait}
    Wait Until Page Contains    ${body}    ${short_wait}
    Wait Until Page Contains    ${btn_acceptAll}    ${short_wait}
    Wait Until Page Contains    ${btn_acceptNecessary}    ${short_wait}
    Wait Until Page Contains    ${btn_selectChoices}    ${short_wait}

Verifier L'affichage De Page Confidentialité
    Wait Until Page Contains    Confidentialité    ${short_wait}
    Wait Until Page Contains    Strictement nécessaires    ${short_wait}

Proceed To Contiue
    Scroll Down By Percentage
    Click By Text    Enregistrer
    Click By Text    OK

Verifier Affichage Welcome Screen
    Wait Until Page Contains    IGNORER    ${short_wait}
    Wait Until Page Contains    SUIVANT    ${short_wait}
