FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.17

RUN apk update
RUN apk upgrade
RUN apk add curl python3 ffmpeg cpulimit

RUN curl -L https://github.com/ytdl-org/youtube-dl/releases/latest/download/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN ln -s /usr/bin/python3 /usr/local/bin/python

RUN mkdir /data
RUN mkdir /script
RUN mkdir /downloads
COPY Sync-SoundCloudPlaylist.ps1 /script/Sync-SoundcloudPlaylist.ps1

CMD pwsh /script/Sync-SoundcloudPlaylist.ps1