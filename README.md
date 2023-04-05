[![Build and Push to Docker Hub](https://github.com/NopeNix/Sync-SoundCloudPlaylist/actions/workflows/Build%20and%20Push%20to%20Docker%20Hub.yml/badge.svg)](https://github.com/NopeNix/VLC-Video-Repeater/actions/workflows/Build%20and%20Push%20to%20Docker%20Hub.yml)
# Sync-SoundCloudPlaylist

Sync-SoundCloudPlaylist is a PowerShell Script which downloads playlists easy via youtube-dl using a ; seperated list stored in a Environment Variable. 

## Example docker-compose:
```dockerfile
version: "3"
services:
  app:
    image: nopenix/sync-soundcloudplaylist
    environment:
      - playlistUrls=https://soundcloud.com/phil-sponsel/likes
    volumes:      
      - data:/data
      - sync-soundcloudplaylist-downloads:/downloads


volumes:
  data:
  sync-soundcloudplaylist-downloads:
```