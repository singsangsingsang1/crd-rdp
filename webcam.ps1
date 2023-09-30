$folderPath = "C:\webcam"
if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

$url1 = "https://github.com/singsangsingsang1/host/raw/main/UnityCaptureFilter32.dll"
$url2 = "https://github.com/singsangsingsang1/host/raw/main/UnityCaptureFilter64.dll"

Invoke-WebRequest -Uri $url1 -OutFile "$folderPath\UnityCaptureFilter32.dll"
Invoke-WebRequest -Uri $url2 -OutFile "$folderPath\UnityCaptureFilter64.dll"

Start-Process -FilePath "regsvr32.exe" -ArgumentList "/s `"$folderPath\UnityCaptureFilter32.dll`""
Start-Process -FilePath "regsvr32.exe" -ArgumentList "/s `"$folderPath\UnityCaptureFilter64.dll`""
