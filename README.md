# docker-streaming

Docker images related to streaming (RIST focused) - multiarch (arm64/amd64)

you can contact the developer on discord: https://discord.gg/khTtNJjFBY

also check out the streaming board documentation on: https://irlbox.com/

**related project:** [Native RIST Setup](https://github.com/moo-the-cow/moo-rist-hosting-native) 

## Quick Start

### Requirement
docker must be running on that machine

get the project files into a folder
```
git clone https://github.com/moo-the-cow/docker-streaming
cd docker-streaming
docker compose up -d
```

### Automated Setup (Recommended)

We provide automated setup scripts for both Windows and Linux/Mac:

#### For HOME Network (username/password authentication only):
#### Linux/Mac
```bash
bash setup-docker-home.sh
```

#### Windows
double click the `setup-docker-home.bat` file

---
## Manual Setup

modify `.env` for username and password

Please check out the Comments inside the .env file there is a setup for HOME-NETWORK and for REMOTE-RELAY

you only need encryption between OBS and the FORWARDER (NOT the RECEIVER) IF you are using REMOTE-RELAY (for security reason)

---
## Description

**ON IRLBOX USE NO ENCRYPTION BUT USERNAME AND PASSWORD TO THE RECEIVER IN ANY SETUP**

**HOME-NETWORK:**
`[irlbox] (username,password,no-encryption,no secret) => [receiver] => [forwarder] (no-encryption, no-secret) => [OBS] (no-encryption, no-secret)`

**REMOTE-RELAY:**
`[irlbox] (username,password,no-encryption,no secret) => [receiver] => [forwarder] (encryption, secret) => [OBS] (encryption, secret)`

**Port Scenario:**
`irlbox => 2030 | relay | <= 5556 OBS`

---
## OBS Setup for RIST

Create a MediaSource Item and uncheck "local"

### HOME NETWORK
put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox` into Input

### REMOTE RELAY
put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox&aes-type=128&secret=[YOUR_VERY_LOG_SECRET_HASH]` into Input

or

put `rist://[RELAY_IP]:[RELAY_PORT]?cname=irlbox&aes-type=256&secret=[YOUR_VERY_LOG_SECRET_HASH]` into Input

put `mpegts` into Input Format

---
## Fix for OBS not refreshing the media source (OBS BUG please report on their github) on stream end (static html)

It also shows a nice overlay showing the bitrate and rtt

HTML Polling version

https://raw.githubusercontent.com/moo-the-cow/streaming-tools/refs/heads/main/obs_RIST_media_source_refresh/index_rist_template.html

Websocket version

https://raw.githubusercontent.com/moo-the-cow/streaming-tools/refs/heads/main/obs_RIST_media_source_refresh/index_rist_websocket_template.html

Configuration File (shared)

https://raw.githubusercontent.com/moo-the-cow/streaming-tools/refs/heads/main/obs_RIST_media_source_refresh/config.js


## Troubleshooting
After you changed your `.env` file make sure you restart docker to read those changes

---
## Faq
### How to config RIST for noalbs?

for dedetailed infos about the noalbs environment file and config check out

https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching

code snippet (only a part)
```
"streamServers": [
        {
          "streamServer": {
            "type": "Rist",
            "statsUrl": "http://moo-rist-stats:8080/stats"
          },
          "name": "RIST",
          "priority": 1,
          "overrideScenes": null,
          "dependsOn": null,
          "enabled": true
        }
```

### Do I have to use noalbs, srtla and rist?
no each of those components can run without the other, but there are sections that must be used if you want to use RIST only

They are marked with BEGIN and END

If you dont want to have noalbs just delete that part
