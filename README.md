# docker-streaming
## RIST (real/pure relay)
### no audio glitches
Docker images related to streaming - multiarch (arm64/amd64)

this would work even on an old raspberry pi 3b (tested)

for noalbs environment file and config check out

https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching

## RIST howto
TLDR setup:

```
git clone https://github.com/moo-the-cow/docker-streaming
#modify `.env` for username and password
docker compose up -d
```

## for how to use RIST in OBS

Create a MediaSource Item and uncheck "local"

put "rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox&aes-type=0&username=[YOUR_USERNAME]&password=[YOURPASSWORD]" into Input

put "mpegts" into Input Format

## for how to use SRTLA in OBS

Create a MediaSource Item and uncheck "local"

put "srt://[RELAY_IP]:[RELAY_PORT]?streamid=play/live/[yourstreamkey]" into Input

on the oncoder streamkey would be publish/live/[yourstreamkey]

put "mpegts" into Input Format

## optional: only enable specific areas
they are marked with BEGIN and END

if you dont want to have noalbs just delete that part
