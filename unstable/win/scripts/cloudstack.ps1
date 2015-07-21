param (
  [switch]$AutoStart = $false
)

Write-Output "AutoStart: $AutoStart"
$is_64bit = [IntPtr]::size -eq 8

# setup cloudagent
$cloudagent_download_url = "http://images.greenqloud.com/CloudInstanceManager.msi"

if (!(Test-Path "C:\Windows\Temp\CloudInstanceManager.msi")) {
    Write-Output "Downloading $cloudagent_download_url"
    (New-Object System.Net.WebClient).DownloadFile($cloudagent_download_url, "C:\Windows\Temp\CloudInstanceManager.msi")
    Start-Process "C:\Windows\System32\msiexec" "/qb /i C:\Windows\Temp\CloudInstanceManager.msi" -NoNewWindow -Wait
}

Start-Service "Cloud.com Instance Manager"

