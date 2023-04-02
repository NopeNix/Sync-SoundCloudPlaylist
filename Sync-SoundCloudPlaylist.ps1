try {
    $playlistUrls = $env:playlistUrls.split(";")
}
catch {
    Throw("You need to provide playlistUrls in form of a environment variable which is also called playlistUrls you can seperate multiple with a ;")
    Exit
} 

if ($null -eq $playlistUrls -or $playlistUrls -eq "") {
    Throw("You need to provide playlistUrls in form of a environment variable which is also called playlistUrls you can seperate multiple with a ;")
    Exit
}

$tracks = $null
$playlistUrls | ForEach-Object {
    Write-Host ("Getting Playlist $_")
    $trackstoadd = & youtube-dl --flat-playlist --dump-json $_ | ConvertFrom-Json
    Write-Host (" -> Received Playlist (" + $trackstoadd.count + " Tracks)")
    $tracks += $trackstoadd
}
Write-Host ("############################################")
Write-Host ("Download of " + $playlistUrls.count + " Playlists completed (" + $track.count + " Tracks)")
Write-Host ("Starting Download of MP3 Files")
foreach ($track in $tracks) {
    & youtube-dl -o "/downloads/%(title)s-%(id)s.%(ext)s" --download-archive "/data/db.txt" --extract-audio --audio-format mp3 $track.url
}

Write-Host ("Cycle Complete Sleeping 5 mins")
Start-Sleep -Seconds (5 * 60)