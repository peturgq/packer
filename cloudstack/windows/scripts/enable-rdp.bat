:: enable RDP:http://technet.microsoft.com/en-us/library/cc782195(v=ws.10).aspx
%SystemRoot%\System32\reg.exe ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
