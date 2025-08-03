# docker-streaming
Docker images related to streaming - multiarch (arm64/amd64)

this would work even on an old raspberry pi 3b (tested)


for noalbs environment file and config check out

https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching

I'm not documenting this much because technicians should be fine to read the docker compose yaml

just a hint you need to replace OBS_IP with the actual ip and the STREAM_ID with your own

see https://irlbox.com/en/rist-self-hosting-guide

for how to use it in OBS

**Other than that you are on your own, about your setup and networking**

## Update
I provided the FULL RIST RELAY now. check out the moo-rist-forwarder section.

This way you can connect FROM your OBS to anywhere (cloud hosting)
