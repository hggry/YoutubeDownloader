param(
    [string]$url,
    [string]$format = "mp4"  #standardformat MP4
)

$youtubeDlPath = "C:\Pfad\zu\youtube-dl.exe"

$userProfile = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$outputFile = Join-Path -Path $userProfile -ChildPath "Downloads\Video.$format"

$outputFormat = if ($format -eq "mp3") { "bestaudio/best" } else { "bestvideo+bestaudio/best" }

Start-Process -Wait -NoNewWindow -FilePath $youtubeDlPath -ArgumentList "-o $outputFile --format $outputFormat $url"
Write-Host "path to video: $outputFile"