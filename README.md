![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/NopeNix/Sync-SoundCloudPlaylist/Build%20and%20Push%20to%20Docker%20Hub.yml?label=Build%20and%20Push%20to%20Docker%20Hub)
![GitHub issues](https://img.shields.io/github/issues-raw/NopeNix/Sync-SoundCloudPlaylist)
![Docker Stars](https://img.shields.io/docker/stars/nopenix/sync-soundcloudplaylist)
![GitHub Repo stars](https://img.shields.io/github/stars/NopeNix/Sync-SoundCloudPlaylist?label=GitHub%20Stars)
![GitHub top language](https://img.shields.io/github/languages/top/NopeNix/Sync-SoundCloudPlaylist)
# Sync-SoundCloudPlaylist
Sync-SoundCloudPlaylist is a PowerShell Script which downloads playlists easy via youtube-dl using a ; seperated list stored in a Environment Variable. This uses [youtube-dl](https://github.com/ytdl-org/youtube-dl) in the background so you could also download everything esle what youtube-dl can.

## Example docker-compose single playlist:
```yml
version: "3"
services:
  app:
    image: nopenix/sync-soundcloudplaylist
    environment:
      - playlistUrls=https://soundcloud.com/phil-sponsel/likes
      - SleepTimerMinutes=5 # Defaults to 5 if nothing else is provided
      - CPULimitPercentageof100=5 # How much % of the CPU(=max100%) can be consumed by the download and convert process
    volumes:      
      - data:/data
      - sync-soundcloudplaylist-downloads:/downloads

volumes:
  data:
  sync-soundcloudplaylist-downloads:
```


## Example docker-compose multiple playlists:
```yml
version: "3"
services:
  app:
    image: nopenix/sync-soundcloudplaylist
    environment:
      - playlistUrls=https://soundcloud.com/phil-sponsel/likes;https://anotherSoundCloudURL
      - SleepTimerMinutes=5 # Defaults to 5 if nothing else is provided
      - CPULimitPercentageof100=5 # How much % of the CPU(=max100%) can be consumed by the download and convert process
    volumes:      
      - data:/data
      - sync-soundcloudplaylist-downloads:/downloads

volumes:
  data:
  sync-soundcloudplaylist-downloads:
```
