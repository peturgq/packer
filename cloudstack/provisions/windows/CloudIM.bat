if not exist "C:\Windows\Temp\CloudInstanceManager.msi" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://downloads.sourceforge.net/cloudstack/Password Management Scripts/CloudInstanceManager.msi', 'C:\Windows\Temp\CloudInstanceManager.msi')" <NUL
)

msiexec /qb /i C:\Windows\Temp\CloudInstanceManager.msi