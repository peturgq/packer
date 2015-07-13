$storageDir = "C:\Windows\Temp"

$webclient = New-Object System.Net.WebClient
$url = "http://sourceforge.net/projects/cloudstack/files/Password%20Management%20Scripts/CloudInstanceManager.msi/"
$file = "$storageDir\CloudInstanceManager.msi"
$webclient.DownloadFile($url,$file)

