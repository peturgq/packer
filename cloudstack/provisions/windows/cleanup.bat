::echo Stopping opensshd
::sc stop opensshd

ping -n 5 127.0.0.1 >nul

::taskkill /F /IM sshd.exe /T

ping -n 2 127.0.0.1 >nul

echo Configuring firewall (Removing SSH from firewall rules
rem close firewall on port 22
cmd /c if exist %Systemroot%\system32\netsh.exe netsh advfirewall firewall delete rule name="SSHD"
cmd /c if exist %Systemroot%\system32\netsh.exe netsh advfirewall firewall delete rule name="ssh"

::echo ==^> Removing files from temp directory
::del /q C:\Windows\Temp\*
::for /d %x in (C:\Windows\Temp\*) do @rd /s /q %x

echo Uninstalling OpenSSHd
takeown /r /d y /f "C:\Program Files\OpenSSH\"
icacls "C:\Program Files\OpenSSH\" /t /grant Everyone:F
cmd /c "C:\Program Files\OpenSSH\uninstall.exe" /S

ping -n 5 127.0.0.1 >nul

rmdir /s /q "C:\Program Files\OpenSSH\"

ping -n 10 127.0.0.1 >nul

rmdir /s /q "C:\Program Files\OpenSSH\"


ping -n 10 127.0.0.1 >nul
cd c:\Windows\System32\sysprep
c:/windows/system32/sysprep/sysprep.exe /generalize /oobe /quiet /shutdown
