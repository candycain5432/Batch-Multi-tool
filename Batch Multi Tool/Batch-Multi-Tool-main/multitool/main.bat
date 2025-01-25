@echo off
title MultiTool - by Ebola Man
chcp 65001 >nul
cd files
color 5
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ╔═(1) Wifi Brute Forcer[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ║[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ╠══(2) Info Collector[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ║[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ╠═══(3) Angry IP[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ║[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m        ╚╦═══(4) VSCode[0m  
ping localhost -n 1 >nul
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚══════^>[0m  
if /I %input% EQU 1 start WifiBf.lnk
if /I %input% EQU 2 start Info.lnk
if /I %input% EQU 3 start ipscan.lnk
if /I %input% EQU 4 start Vscode.lnk
cls
goto start

:banner
cls
ping localhost -n 1 >nul
echo                     [38;2;255;0;0m███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗[0m     
ping localhost -n 1 >nul
echo                     [38;2;255;51;0m████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
ping localhost -n 1 >nul
echo                     [38;2;255;102;0m██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║    [0m 
ping localhost -n 1 >nul
echo                     [38;2;255;153;0m██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     [0m
ping localhost -n 1 >nul
echo                     [38;2;255;204;0m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗[0m
ping localhost -n 1 >nul
echo                     [38;2;255;255;0m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
ping localhost -n 1 >nul
echo.
