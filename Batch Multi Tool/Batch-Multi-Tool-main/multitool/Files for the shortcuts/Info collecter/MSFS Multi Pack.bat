@echo off
title Info Collector
color 0A
mode con: cols=120 lines=30


echo Initializin Info Collector...
timeout /t 1 >nul

:: File to save outputs
set outputFile="Info"

:: Ensure the output file is empty or create it if it doesn't exist
> %outputFile% echo Gathering system information...

:: Fancy loading effect
echo.
for /l %%a in (1,1,3) do (
    echo [INFO] Scanning systems.
    timeout /nobreak /t 1 >nul
    cls
    echo [INFO] Scanning systems..
    timeout /nobreak /t 1 >nul
    cls
    echo [INFO] Scanning systems...
    timeout /nobreak /t 1 >nul
    cls
)

:: System Information
echo [SYSTEM INFORMATION] >> %outputFile%
systeminfo | find "OS" >> %outputFile%
systeminfo | find "Memory" >> %outputFile%
systeminfo | find "Boot Time" >> %outputFile%

:: CPU Information
echo [CPU INFORMATION] >> %outputFile%
wmic cpu get caption, deviceid, numberofcores, maxclockspeed >> %outputFile%

:: Disk Information
echo [DISK INFORMATION] >> %outputFile%
wmic logicaldisk get caption, size, freespace >> %outputFile%

:: Network Information
echo [NETWORK INFORMATION] >> %outputFile%
ipconfig /all >> %outputFile%

:: User Information
echo [USER INFORMATION] >> %outputFile%
echo Logged in user: %username% >> %outputFile%
net user >> %outputFile%

:: Graphics Card Information
echo [GRAPHICS CARD INFORMATION] >> %outputFile%
wmic path win32_videocontroller get caption >> %outputFile%

:: System Architecture
echo [SYSTEM ARCHITECTURE] >> %outputFile%
wmic os get osarchitecture >> %outputFile%

:: Date and Time
echo [DATE AND TIME] >> %outputFile%
echo Current Date: %date% >> %outputFile%
echo Current Time: %time% >> %outputFile%

:: Running Processes
echo [RUNNING PROCESSES] >> %outputFile%
tasklist >> %outputFile%

:: Battery Information
echo [BATTERY INFORMATION] >> %outputFile%
wmic path Win32_Battery get Status >> %outputFile%

:: Installed Updates
echo [INSTALLED UPDATES] >> %outputFile%
wmic qfe list brief /format:table >> %outputFile%

:: File System Information
echo [FILE SYSTEM INFORMATION] >> %outputFile%
wmic logicaldisk get caption, filesystem >> %outputFile%

:: Firewall Status
echo [FIREWALL STATUS] >> %outputFile%
netsh advfirewall show allprofiles >> %outputFile%

:: Installed Applications
echo [INSTALLED APPLICATIONS] >> %outputFile%
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall >> %outputFile%
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall >> %outputFile%

:: Environment Variables
echo [ENVIRONMENT VARIABLES] >> %outputFile%
set >> %outputFile%

:: System Services
echo [SYSTEM SERVICES] >> %outputFile%
sc query >> %outputFile%

:: Network Adapter Information
echo [NETWORK ADAPTER INFORMATION] >> %outputFile%
wmic nicconfig get caption, IPAddress, MACAddress >> %outputFile%

:: Wi-Fi SSID and Password
echo [WIFI SSID AND PASSWORD] >> %outputFile%
for /f "tokens=1,* delims=:" %%a in ('netsh wlan show profiles') do (
    set profile=%%b
    set profile=!profile:~1!
    if not "!profile!"=="" (
        echo SSID: !profile! >> %outputFile%
        netsh wlan show profile name="!profile!" key=clear | findstr /R /C:"Key Content" >> %outputFile%
    )
)



