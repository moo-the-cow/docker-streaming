# docker-streaming
## RIST (real/pure relay)
### no audio glitches
Docker images related to streaming - multiarch (arm64/amd64)

this would work even on an old raspberry pi 3b (tested)

for noalbs environment file and config check out

https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching

## RIST howto
TLDR setup (OBS and Relay on same Home-Network)

modify `.env` for username and password
```
git clone https://github.com/moo-the-cow/docker-streaming
docker compose up -d
```

Please check out the Comments inside the .env file there is a setup for HOME-NETWORK and for REMOTE-RELAY

you only need encryption between OBS and the FORWARDER (NOT the RECEIVER) IF you are using REMOTE-RELAY (for security reason)

**ON IRLBOX USE NO ENCRYPTION BUT USERNAME AND PASSWORD TO THE RECEIVER IN ANY SETUP**

**HOME-NETWORK:**
`[irlbox] (username,password,no-encryption,no secret) => [receiver] => [forwarder] (no-encryption, no-secret) => [OBS] (no-encryption, no-secret)`

**REMOTE-RELAY:**
`[irlbox] (username,password,no-encryption,no secret) => [receiver] => [forwarder] (encryption, secret) => [OBS] (encryption, secret)`

## for how to use RIST in OBS

Create a MediaSource Item and uncheck "local"

### HOME NETWORK
put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox` into Input

### REMOTE RELAY
put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox&aes-type=128&secret=[YOUR_VERY_LOG_SECRET_HASH]` into Input

or

put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox&aes-type=256&secret=[YOUR_VERY_LOG_SECRET_HASH]` into Input

put `mpegts` into Input Format

## Fix for OBS not refreshing the media source on stream end (static html)

It also shows a nice overlay showing the bitrate and rtt

HTML Polling version

https://raw.githubusercontent.com/moo-the-cow/streaming-tools/refs/heads/main/obs_RIST_media_source_refresh/index_rist_template.html

Websocket version

https://raw.githubusercontent.com/moo-the-cow/streaming-tools/refs/heads/main/obs_RIST_media_source_refresh/index_rist_websocket_template.html

## for how to use SRTLA in OBS

Create a MediaSource Item and uncheck `local`

put `srt://[RELAY_IP]:[RELAY_PORT]?streamid=play/live/[yourstreamkey]` into Input

on the oncoder streamkey would be publish/live/[yourstreamkey]

put `mpegts` into Input Format

## optional: only enable specific areas
they are marked with BEGIN and END

if you dont want to have noalbs just delete that part
