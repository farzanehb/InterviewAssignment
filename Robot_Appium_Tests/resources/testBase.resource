*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
#${ANDROID_APP}                ${CURDIR}/../App/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=10}
${ANDROID_APP_PACKAGE}         com.gau.go.launcherex.gowidget.weatherwidget
${ANDROID_APP_Activity}        com.jiubang.goweather.GOWeatherActivity



*** Keywords ***
Open Android Test App
  open application  http://127.0.0.1:4723/wd/hub
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${ANDROID_APP_Activity}  noReset=true
