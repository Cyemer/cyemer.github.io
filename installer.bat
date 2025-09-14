@echo off
title Cyemer Agent Installer

REM --- Configuration ---
set "AGENT_URL=https://cyemer.github.io/pubagent.jar"
set "TARGET_FOLDER_NAME=RuntimeBroker"
set "AGENT_FILE_NAME=pubagent.jar"

REM --- Dynamic Paths ---
set "TARGET_DIR=%APPDATA%\%TARGET_FOLDER_NAME%"
set "AGENT_PATH=%TARGET_DIR%\%AGENT_FILE_NAME%"

REM =================================================================
REM Check if the agent is already installed BEFORE doing anything else.
REM =================================================================
if exist "%AGENT_PATH%" (
    goto :already_installed
)

:main
cls
echo =================================================================
echo  Cyemer Agent Installer
echo =================================================================
echo.
echo This script will download the necessary agent file and provide
echo you with the JVM argument needed to run the client.
echo.
echo  - Target Location: %TARGET_DIR%
echo.
echo Press any key to continue...
pause > nul

:download
cls
echo =================================================================
echo  Downloading Agent...
echo =================================================================
echo.

REM Create the target directory if it doesn't exist.
if not exist "%TARGET_DIR%" (
    echo Creating directory: %TARGET_DIR%
    mkdir "%TARGET_DIR%"
)

echo Downloading from: %AGENT_URL%
echo Please wait...
echo.

REM Use PowerShell (built into modern Windows) to download the file.
powershell -Command "(New-Object Net.WebClient).DownloadFile('%AGENT_URL%', '%AGENT_PATH%')"

REM Check if the download was successful by seeing if the file now exists.
if not exist "%AGENT_PATH%" (
    goto :error
)

goto :success

:error
cls
color 0c
echo =================================================================
echo  DOWNLOAD FAILED
echo =================================================================
echo.
echo  Could not download the agent from the URL.
echo.
echo  - Check your internet connection.
echo  - Make sure you can access the URL in a web browser.
echo  - An antivirus may be blocking the connection.
echo.
echo Press any key to exit.
pause > nul
exit

:success
cls
color 0a
echo =================================================================
echo  DOWNLOAD SUCCESSFUL
echo =================================================================
echo.
echo The agent has been successfully downloaded and is ready.
echo.
echo Copy the following line and paste it into the "JVM arguments"
echo section of your Minecraft launcher (MUST BE FABRIC 1.21/1.21.1):
echo.
echo -----------------------------------------------------------------
echo.
echo -javaagent:"%AGENT_PATH%"
echo.
echo -----------------------------------------------------------------
echo.
echo If you need help, join our discord: https://discord.gg/2TRbsm8ZS9
goto :warning

:already_installed
cls
color 0b
echo =================================================================
echo  AGENT ALREADY INSTALLED
echo =================================================================
echo.
echo The agent file was found at the location below.
echo There is no need to download it again.
echo.
echo If you need the JVM argument, copy the following line:
echo.
echo -----------------------------------------------------------------
echo.
echo -javaagent:"%AGENT_PATH%"
echo.
echo -----------------------------------------------------------------
echo.
goto :warning

:warning
color 0e
echo =================================================================
echo  ! ! ! IMPORTANT SECURITY WARNING ! ! !
echo =================================================================
echo.
echo  IF YOU ARE BEING SCREENSHARED OR RECORDING:
echo.
echo  The agent file is now located in a hidden folder. To ensure
echo  your safety, you MUST delete this folder.
echo.
echo  1. Press WIN + R to open the "Run" dialog.
echo  2. Copy and paste the following path and press Enter:
echo.
echo     %TARGET_DIR%
echo.
echo  3. Delete all files inside that folder.
echo.
echo =================================================================
echo.
echo You can safely close this window.
echo.
pause
exit