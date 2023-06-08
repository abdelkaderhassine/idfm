*** Settings ***
Documentation    Keywords for local testing
Variables    ${EXECDIR}/globalsettings.yaml

*** Variables ***
${remote_url}               http://127.0.0.1:4723/
${appPackage}               com.applidium.vianavigo
${appActivity}              com.applidium.vianavigo.views.MainVianavigo
${AllowPopupCap_iOS}        autoAcceptAlerts
${AllowPopupCap_Android}    autoGrantPermissions
&{DESIRED_CAPABILITIES_Android}
...                         appium:deviceName=${deviceName}    # emulator-5554  R58NA4JWSVN
...                         platformName=${platformName}
...                         appium:appPackage=${appPackage}
...                         appium:appActivity=${appActivity}
#...                         appium:language=${language}
...                         appium:automationName=Uiautomator2
#...                         appium:locale=${language}
#...                         ${AllowPopupCap_${platformName}}=true

&{DESIRED_CAPABILITIES_iOS}
...                         appium:deviceName=${deviceName}    # emulator-5554  R58NA4JWSVN
...                         platformName=${platformName}
...                         appium:app=${appPath}
...                         appium:fullReset=${fullReset}
...                         appium:language=${language}
...                         appium:xcodeOrgId=KQZ7KNLUG5
...                         appium:xcodeSigningID=iPhone Developer
...                         appium:automationName=XCUITest