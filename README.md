![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/NopeNix/Sync-SoundCloudPlaylist/Build%20and%20Push%20to%20Docker%20Hub.yml?label=Build%20and%20Push%20to%20Docker%20Hub)
![GitHub issues](https://img.shields.io/github/issues-raw/NopeNix/Sync-SoundCloudPlaylist)
![Docker Stars](https://img.shields.io/docker/stars/nopenix/sync-soundcloudplaylist)
![GitHub Repo stars](https://img.shields.io/github/stars/NopeNix/Sync-SoundCloudPlaylist?label=GitHub%20Stars)
![GitHub top language](https://img.shields.io/github/languages/top/NopeNix/Sync-SoundCloudPlaylist)
# Sync-SoundCloudPlaylist

Sync-SoundCloudPlaylist is a PowerShell Script which downloads playlists easy via youtube-dl using a ; seperated list stored in a Environment Variable. 

## Example docker-compose:
```yml
version: "3"
services:
  app:
    image: nopenix/sync-soundcloudplaylist
    environment:
      - playlistUrls=https://soundcloud.com/phil-sponsel/likes
    volumes:      
      - data:/data
      - sync-soundcloudplaylist-downloads:/downloads
    deploy:
        resources:
            limits:
              cpus: "0.05" # Limit CPU Usage otherwise its quite high, kinda too high when designed as background task


volumes:
  data:
  sync-soundcloudplaylist-downloads:
```