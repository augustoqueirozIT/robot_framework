*** Settings ***
Documentation                           Automation to test all success login.

Library                                 SeleniumLibrary

Suite Setup                             Open Browser        ${url}        ${browser}        options=add_experimental_option("detach", True)
Suite Teardown                          Close Browser

*** Variables ***
${url}                                  https://www.saucedemo.com/
${browser}                              chrome

${div_login}                            //div[@id='login_button_container']
${input_username}                       //input[@id='user-name']
${input_password}                       //input[@id='password']
${button_login}                         //input[@id='login-button']
${title_swag_labs}                      //div[@class="bm-menu-wrap"]
${button_menu}                          //button[@id='react-burger-menu-btn']
${button_logout}                        //a[@id='logout_sidebar_link']


*** Keywords ***
Login Test
    [Arguments]                         ${username}                  ${password}

    Maximize Browser Window
    Page Should Contain Element         ${div_login}
    Input Text                          ${input_username}            ${username}
    Input Text                          ${input_password}            ${password}
    Click Element                       ${button_login}
    Wait Until Element Is Visible       ${title_swag_labs}
    Click Element                       ${button_menu}
    Wait Until Element Is Visible       ${button_logout}
    Click Element                       ${button_logout}
    Page Should Contain Element         ${div_login}

*** Test Cases ***
Test 1
    Login Test            standard_user                secret_sauce
    Login Test            problem_user                 secret_sauce
    Login Test            performance_glitch_user      secret_sauce