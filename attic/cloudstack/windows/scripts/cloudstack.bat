if not exist "C:\Windows\Temp\CloudInstanceManager.msi" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://downloads.sourceforge.net/cloudstack/Password Management Scripts/CloudInstanceManager.msi', 'C:\Windows\Temp\CloudInstanceManager.msi')" <NUL
)

msiexec /qb /i C:\Windows\Temp\CloudInstanceManager.msi
:: sc config "Cloud.com Instance Manager" depend= LanmanServer/RPCSS
:: net start "Cloud.com Instance Manager"

:: There is a problem with the template where cloud instance manager
:: runs only after a reboot. So, this makes the machine auto-reboot once.
regedit /S C:\cloud-instance-manager.reg
