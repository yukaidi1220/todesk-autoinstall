@echo off
if exist "C:\Program Files\ToDesk\ToDesk.exe" echo ToDesk�Ѱ�װ����������˳� & pause & exit
cls
if exist "C:\Program Files (x86)\ToDesk\ToDesk.exe" echo ToDesk�Ѱ�װ����������˳� & pause & exit
cls
if not exist "C:\Program Files" echo C:\Program Files �����ڣ���������˳� & pause & exit
cls
md "C:\Program Files\ToDesk"
echo [ConfigInfo]>"C:\Program Files\ToDesk\config.ini"
echo passUpdate=0>>"C:\Program Files\ToDesk\config.ini"
echo PrivateScreenLockScreen=0>>"C:\Program Files\ToDesk\config.ini"
echo autoLockScreen=0>>"C:\Program Files\ToDesk\config.ini"
echo WeakPasswordTip=0>>"C:\Program Files\ToDesk\config.ini"
echo isUpdate=0>>"C:\Program Files\ToDesk\config.ini"
echo AuthMode=0>>"C:\Program Files\ToDesk\config.ini"
echo autoupdate=0>>"C:\Program Files\ToDesk\config.ini"
echo filetranstip=0>>"C:\Program Files\ToDesk\config.ini"
echo isexpand=0>>"C:\Program Files\ToDesk\config.ini"
echo UpdateTempPassDefault=1>>"C:\Program Files\ToDesk\config.ini"
echo Version=4.6.0.0>>"C:\Program Files\ToDesk\config.ini"
echo tempAuthPass=MDAwMA==>>"C:\Program Files\ToDesk\config.ini"
cls
echo ��ʼ����
if exist %windir%\system32\curl.exe curl -o %temp%\ToDesk_Setup.exe https://dl.todesk.com/windows/ToDesk_Setup.exe
cls
if not exist %windir%\system32\curl.exe powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.todesk.com/windows/ToDesk_Setup.exe', '"%temp%\ToDesk_Setup.exe"')"
cls
if not exist %temp%\ToDesk_Setup.exe echo ����ʧ�ܣ��������� & powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.todesk.com/windows/ToDesk_Setup.exe', '"%temp%\ToDesk_Setup.exe"')"
cls
if not exist %temp%\ToDesk_Setup.exe echo ����ʧ�ܣ���������˳� & pause & exit
cls
echo ��ʼ��װ
start /wait %temp%\ToDesk_Setup.exe /S
cls

timeout -t 1
taskkill /f /im ToDesk_Service.exe
taskkill /f /im ToDesk.exe
timeout -t 1
taskkill /f /im ToDesk_Service.exe
taskkill /f /im ToDesk.exe
cls

if exist "C:\Program Files\ToDesk\ToDesk.exe" echo ToDesk��װ�ɹ������������ToDesk��ҳ�沢�˳� & del /f /q %temp%\ToDesk_Setup.exe & pause & start "" "C:\Program Files\ToDesk\ToDesk.exe"
cls
if not exist "C:\Program Files\ToDesk\ToDesk.exe" cls & echo ToDesk��װʧ�ܣ������� & pause
exit

by yukaidi
yukaidi.top