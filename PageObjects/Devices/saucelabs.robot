*** Settings ***
Documentation    Keywords for Sauce labs
Variables    ${EXECDIR}/globalsettings.yaml

*** Variables ***
${Sauce_Username}           <username_hidden>
${Sauce_ApiKey}             <apikey_hidden>
${Device_provider_URL}      ${Sauce_Username}:${Sauce_ApiKey}@ondemand.eu-central-1.saucelabs.com:443
${remote_url}               https://${Device_provider_URL}/wd/hub
${AllowPopupCap_iOS}        autoAcceptAlerts
${AllowPopupCap_Android}    autoGrantPermissions
&{DESIRED_CAPABILITIES}
...                         deviceName=${deviceName}Z
...                         platformName=${platformName}
...                         sessionName=Appium test
...                         language=${language}
...                         locale=${language}
...                         ${AllowPopupCap_${platformName}}=true
...                         phoneOnly=true
...                         platformVersion=${platformVersion}
...                         app=storage:filename=app_for_test.ipa