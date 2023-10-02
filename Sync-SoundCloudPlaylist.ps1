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

if ($null -eq $env:SleepTimerMinutes) {
    # Setting a default of 5 mins if nothing is specidied
    $env:SleepTimerMinutes = 5
}

while ($true) {
    $tracks = $null
    $playlistUrls | ForEach-Object {
        Write-Host ("Getting Playlist $_")
        try {
            $trackstoadd = & youtube-dl --flat-playlist --dump-json $_ | ConvertFrom-Json
            Write-Host (" -> Received Playlist (" + $trackstoadd.count + " Tracks)")
            $tracks += $trackstoadd
        }
        catch {
            Write-Host ("ERROR: " + $_.Exception.Message)
            Write-Host ("FATAL: Canot Continue Script, Exiting!")
            Exit
        }
    }
    Write-Host ("############################################")
    Write-Host ("Download of " + $playlistUrls.count + " Playlists completed (" + $tracks.count + " Tracks)")
    Write-Host ("Starting Download of MP3 Files")
    foreach ($track in $tracks) {
        & youtube-dl -o "/downloads/%(title)s-%(id)s.%(ext)s" --download-archive "/data/db.txt" --extract-audio --audio-format mp3 $track.url --postprocessor-args '-threads 1'
    }
    
    Write-Host ("Cycle Complete Sleeping " + $env:SleepTimerMinutes + " mins")
    Write-Host ""
    Start-Sleep -Seconds ($env:SleepTimerMinutes * 60)
}