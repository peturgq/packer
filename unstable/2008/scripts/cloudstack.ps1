param (
  [switch]$AutoStart = $false
)

Write-Output "AutoStart: $AutoStart"
$is_64bit = [IntPtr]::size -eq 8

# get dotnet4

$dotnet_download_url = "http://images.qstack.com/win/dotNetFx40_Full_x86_x64.exe"

if (!(Test-Path "C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe")) {
    Write-Output "Downloading $dotnet_download_url"
    (New-Object System.Net.WebClient).DownloadFile($dotnet_download_url, "C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe")
#    Start-Process "start" "/wait C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe /passive" -NoNewWindow -Wait
$dotnetexe = "C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe"
$arguments = "/passive"
start-process $dotnetexe $arguments  -NoNewWindow -Wait
}

# setup cloudagent
$cloudagent_download_url = "http://images.qstack.com/win/CloudInstanceManager.msi"

if (!(Test-Path "C:\Windows\Temp\CloudInstanceManager.msi")) {
    Write-Output "Downloading $cloudagent_download_url"
    (New-Object System.Net.WebClient).DownloadFile($cloudagent_download_url, "C:\Windows\Temp\CloudInstanceManager.msi")
    Start-Process "C:\Windows\System32\msiexec" "/qb /i C:\Windows\Temp\CloudInstanceManager.msi" -NoNewWindow -Wait
}

Start-Service "Cloud.com Instance Manager"

