FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.17

RUN apk update
RUN apk upgrade
RUN apk add curl python3 ffmpeg

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN ln -s /usr/bin/python3 /usr/local/bin/python

RUN mkdir /data
RUN mkdir /downloads
COPY Sync-SoundCloudPlaylist.ps1 /data/Sync-SoundcloudPlaylist.ps1

CMD pwsh /data/Sync-SoundcloudPlaylist.ps1