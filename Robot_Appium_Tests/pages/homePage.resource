*** Settings ***
Library     AppiumLibrary
Library     BuiltIn
Library     String


*** Variables ***
${city_dropDown}        //*[@resource-id='com.gau.go.launcherex.gowidget.weatherwidget:id/img_arrow']
${first_city}           //*[@resource-id='com.gau.go.launcherex.gowidget.weatherwidget:id/txt_city_name']
${temp_elem}            //*[@resource-id='com.gau.go.launcherex.gowidget.weatherwidget:id/weather_current_tempc']
${scroll_start}         //*[@resource-id='com.gau.go.launcherex.gowidget.weatherwidget:id/weather_forecast_linechart']
${scroll_end}
...    //*[@resource-id='com.gau.go.launcherex.gowidget.weatherwidget:id/weather_forecast_pay_function']

${screenshot_title}     captured_image


*** Keywords ***
User has selected the first city in the list
    Wait Until Page Contains Element    ${city_dropDown}
    Click Element    ${city_dropDown}
    Click Element    ${first_city}

User selects a tab
    [Arguments]    ${tab}
    Click Element    //android.widget.TextView[@text='${tab}']

Current tempreture should not equal to
    [Arguments]    ${test_temp}
    ${text}=    Get Text    ${temp_elem}
    ${current_temp}=    Remove String    ${text}    °
    Should Not Be Equal    ${current_temp}    ${test_temp}

User scrolls down to take screenshot
    Custom Swipe    ${scroll_start}    ${scroll_end}
    Capture Page Screenshot

Target section should exist
    [Arguments]    ${target_section}
    Wait Until Page Contains Element    //*[@text='${target_section}']

Custom Swipe
    [Arguments]    ${elem1}    ${elem2}
    ${element1_size}=    Get Element Size    ${elem1}
    ${element1_location}=    Get Element Location    ${elem1}
    ${element2_size}=    Get Element Size    ${elem2}
    ${element2_location}=    Get Element Location    ${elem2}
    ${start_x}=    Evaluate    ${element2_location['x']} + (${element2_size['width']} * 0.5)
    ${start_y}=    Evaluate    ${element2_location['y']} + (${element2_size['height']} * 0.5)
    ${end_x}=    Evaluate    ${element1_location['x']} + (${element1_size['width']} * 0.5)
    ${end_y}=    Evaluate    ${element1_location['y']} + (${element1_size['height']})
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    500
