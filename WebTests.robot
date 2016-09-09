*** Settings ***
Documentation     Test suite created with FireRobot.
Library           Selenium2Library    15.0    5.0
Library           XvfbRobot

*** Variables ***
${BROWSER}        gc    # ff ie gc
${username}       eficode
${REMOTE_ENABLED}    NO
${password}       testaaja

*** Test Cases ***
FireRobot Test Case
    Run Keyword If    '${REMOTE_ENABLED}'=='YES'    Start Virtual Display    width=1440    height=900    colordepth=24
    Open Browser    https://www.google.fi/#gws_rd=ssl    ${BROWSER}
    Input Text    lst-ib    ${username}
    Page Should Contain Element    xpath=.//cite[contains(normalize-space(.), 'www.eficode.fi/')]
    Click Link    http://www.eficode.fi/
    Page Should Contain    Kaikki on koodia
    Click Element    nav-toggler
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Palvelut')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Caset')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Ura')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Blogi')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Tapahtumat')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Eficode')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'Yhteydenotto')])[1]
    Wait Until Page Contains Element    xpath=(.//a[contains(normalize-space(.), 'In English')])[last()]
    Click Element    nav-toggler
    Close Browser

Ponsse_Login
    Run Keyword If    '${REMOTE_ENABLED}'=='YES'    Start Virtual Display    width=1440    height=900    colordepth=24
    Open Browser    https://fleetmanagement.ponsse.com/    ${BROWSER}
    Input Text    ctl00_ContentPlaceHolder1_TextBox_UserName    ${username}
    Input Text    ctl00_ContentPlaceHolder1_TextBox_Password    ${password}
    Click Element    ctl00_ContentPlaceHolder1_Button_Login
    Page Should Contain    Username or password incorrect.
    Close Browser
