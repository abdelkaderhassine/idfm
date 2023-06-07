*** Settings ***
Documentation    Keywords for local testing
Variables    ${EXECDIR}/globalsettings.yaml

*** Variables ***
${remote_url}               http://127.0.0.1:4723/
${appPackage}               com.applidium.vianavigo
${appActivity}              com.applidium.vianavigo.views.MainVianavigo
${AllowPopupCap_iOS}        autoAcceptAlerts
${AllowPopupCap_Android}    autoGrantPermissions
&{DESIRED_CAPABILITIES}
...                         appium:deviceName=${deviceName}    # emulator-5554  R58NA4JWSVN
...                         platformName=${platformName}
...                         appium:appPackage=${appPackage}
...                         appium:appActivity=${appActivity}
#...                         appium:language=${language}
#...                         appium:locale=${language}
#...                         ${AllowPopupCap_${platformName}}=true