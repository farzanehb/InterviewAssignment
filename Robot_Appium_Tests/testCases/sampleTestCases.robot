*** Settings ***
Documentation       This file includes test cases for snappBox interview process

Resource            ${CURDIR}${/}../Pages/homePage.resource
Resource            ${CURDIR}${/}../Resources/testBase.resource

Suite Setup         Open Android Test App


*** Variables ***
${current_tab}          Current
${test_temp}            50
${forcast_tab}          Forecast
${target_section}       Precipitation


*** Test Cases ***
Check "Current" tab
    Given User has selected the first city in the list
    When User selects a tab    ${current_tab}
    Then Current tempreture should not equal to    ${test_temp}

Check "Forcast" tab
    Given User has selected the first city in the list
    When User selects a tab    ${forcast_tab}
    And User scrolls down to take screenshot
    Then Target section should exist    ${target_section}
