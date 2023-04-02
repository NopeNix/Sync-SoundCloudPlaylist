# Sync-SoundCloudPlaylist

Sync-SoundCloudPlaylist is a PowerShell Script which downloads playlists. A Docker container is available

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