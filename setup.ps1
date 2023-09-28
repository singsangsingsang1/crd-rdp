Set-DisplayResolution -Width 1920 -Height 1080 -Force
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}
& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait; Remove-Item $P}


$folderPath = "C:\livestream"
$pythonScriptUrl = "https://github.com/singsangsingsang1/host/blob/main/main.py"
$dllFileUrl = "https://github.com/singsangsingsang1/host/raw/main/LivestreamProcessor.dll"

New-Item -Path $folderPath -ItemType Directory -Force

Invoke-WebRequest -Uri $pythonScriptUrl -OutFile "$folderPath\main.py"

Invoke-WebRequest -Uri $dllFileUrl -OutFile "$folderPath\LivestreamProcessor.dll"

Start-Process -FilePath "python.exe" -ArgumentList "$folderPath\main.py"
