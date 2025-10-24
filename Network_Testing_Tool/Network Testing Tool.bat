@echo off

title Network Testing Tool
cls

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo PLEASE RUN THIS SCRIPT AS ADMINISTRATOR!
    title PLEASE RUN THIS SCRIPT AS ADMINISTRATOR!
	pause
    exit /b
)

arp -a
arp -a | findstr /v "Interface"

pause

netstat -ano
netstat -ano | findstr "LISTENING"
netstat -n                           
netstat -r

pause

getmac
getmac /v

pause

ipconfig /all | findstr "Physical Address"
ipconfig /all | findstr "DHCPv6 Client DUID"
ipconfig /all | findstr "DNS Servers"
ipconfig /all | findstr "Link-local IPv6 Address"
ipconfig /all | findstr "Default Gateway"
ipconfig /all | findstr "IPv4"
ipconfig /all | findstr "DHCP Servers"
ipconfig /all | findstr /C:"Subnet Mask"

pause

echo -----------System info-----------
pause

systeminfo

wmic cpu get loadpercentage

wmic OS get FreePhysicalMemory
pause

echo -----------Ping Test-----------
echo Warning This Can Take 3-4 mins
pause > nul

ping -n 4 8.8.8.8

ping google.com

tracert google.com

pause > nul


