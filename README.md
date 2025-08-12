# docker-streaming
## RIST (real/pure relay)
### no audio glitches
Docker images related to streaming - multiarch (arm64/amd64)

this would work even on an old raspberry pi 3b (tested)

for noalbs environment file and config check out

https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching

## RIST howto
you only need to do `docker compose up -d` and before that modify `.env` for the SECRET_HASH_KEY

see https://irlbox.com/en/rist-self-hosting-guide

for how to use it in OBS

**Other than that you are on your own, about your setup and networking**

## Update
I provided the FULL RIST RELAY now. check out the moo-rist-forwarder section.

This way you can connect FROM your OBS to anywhere (cloud hosting)
