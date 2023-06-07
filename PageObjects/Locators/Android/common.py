#Retour vers Homepage screen
btn_retourToHomePage= '//*[@content-desc="Retour"]'


#Iténiraire tab
btn_moreOptions = '//*[@text="xxxx"]//following-sibling::*[contains(@resource-id,"more") or contains(@resource-id,"menu")]'

inp_nommerEditText = '//*[@resource-id="com.applidium.vianavigo:id/editText"]'
inp_searchEditText = 'searchEditText'
ico_addAsFavoriteButton = 'addAsFavoriteButton'

iti_txt_optionListRI = '//*[@resource-id="com.applidium.vianavigo:id/title" and contains(@text,"xxxx")]'

#Recherche Itinéraires
ri_btn_inverserDepartArrivee =   '//android.view.View[@content-desc="Inverser les champs départ et arrivée"]'
ri_btn_filtres =   '//android.widget.ImageView[@content-desc="Paramètres"]'

ri_ico_modeTransport_publique = '//android.widget.ImageView[@content-desc="Transport en commun"]'
ri_ico_modeTransport_velo =  '//android.widget.ImageView[@content-desc="Vélo perso"]'
ri_ico_modeTransport_covoiturage = '//android.widget.ImageView[@content-desc="Covoiturage"]'

ri_inp_depart =  '//*[@text="Départ"]/following-sibling::android.widget.TextView[not(contains(@text,"Maintenant"))]'
ri_inp_arrivee =  '//*[@text="Arrivée"]/following-sibling::android.widget.TextView'
ri_inp_heure =   'xpath=(//*[@text="Départ"]/following-sibling::android.widget.TextView)[2]'

ri_btn_partirPlusTot = '//*[@text="-10 min"]/parent::android.view.View'
ri_btn_partirPlusTard =  '//*[@text="+10 min"]/parent::android.view.View'

ri_blc_rootResult = '//*[@resource-id="com.applidium.vianavigo:id/resultRoot"]'
ri_blc_loop_rootResult= 'xpath=(//*[@resource-id="com.applidium.vianavigo:id/resultRoot"])[xxxx]'
ri_ico_dataLoadingSpinner =  '//*[@resource-id="com.applidium.vianavigo:id/animation_view"]'
