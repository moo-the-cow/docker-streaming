

## 2. Requirements

- **Docker & Docker Compose:** Latest versions recommended
- **Hardware/OS:** Works on ARM64 (Raspberry Pi, Orange Pi, Radxa) and AMD64 Linux
- **Ports:** Must allow inbound/outbound UDP/TCP as described in [Essential Ports](#4-essential-ports)
- **OBS:** Latest version recommended

> 💡 **Tip:** Docker deployment is the easiest way to get RIST relay running quickly.

---

## 3. Quick Start

1. **Clone the repository:**

   ```bash
   git clone https://github.com/moo-the-cow/docker-streaming
   cd docker-streaming
   ```

2. **Edit the .env file:**

   ⚠️ **Important:** The defaults will NOT work - you must customize them.

   ```bash
   nano .env
   ```

   Adjust ports, keys, and URLs to match your environment.

3. **Launch the containers:**

   ```bash
   docker compose up -d
   ```

4. **Check running status:**

   ```bash
   docker ps
   ```

> 📸 **Screenshot Placeholder:** Show Docker containers running.

---

## 4. Essential Ports

| Container | Port | Protocol | Purpose |
|-----------|------|----------|---------|
| moo-rist | 2030 | UDP | RIST stream access (IRLbox/Moblin) |
| moo-rist-forwarder | 5556 | UDP | OBS ingest access |
| moo-rist-stats | 8681 | TCP | (Optional) Stats – HTTP GET polling |
| moo-rist-stats | 8682 | TCP | (Optional) Stats – WebSocket |

> 💡 **Tip:** Left side = host port. Right side = container port.  
> Make sure your firewall forwards host ports if you need external access.

---

## 5. OBS Setup

1. **Open OBS** → Create a **Media Source**.

2. **URL format:**

   ```
   rist://YOUR_SERVER_IP:5556?cname=moo-rist-relay&aes-type=128&secret=YOUR_SECRET_HASH_KEY
   ```

   - Replace `YOUR_SERVER_IP` with the public or LAN IP of your relay.
   - Replace `YOUR_SECRET_HASH_KEY` with your encryption key.

3. **Input format:** `mpegts`

> 📸 **Screenshot Placeholder:** Show OBS Media Source settings.

---

## 6. NoALBS Integration

If you use NoALBS for automatic scene switching, add the RIST relay as a streamServer.

**Example config snippet:**

```json
"streamServers": [
  {
    "streamServer": {
      "type": "SrtLiveServer",
      "statsUrl": "http://srtla-live-server:8181/stats",
      "publisher": "publish/live/xxxxx"
    },
    "name": "SLS",
    "priority": 0,
    "enabled": true
  },
  {
    "streamServer": {
      "type": "Rist",
      "statsUrl": "http://moo-rist-stats:8080/stats"
    },
    "name": "RIST",
    "priority": 1,
    "enabled": true
  }
]
```

- **Internal Ports:** Use the right-hand (container) ports.
- **External Access:** Use the left-hand (host) ports for firewalled or remote access.

> 📸 **Screenshot Placeholder:** Show NoALBS config.json with stats URL configuration highlighted.

---

## 7. Container Management

### Start/Stop Containers

```bash
# Start all containers
docker compose up -d

# Stop all containers
docker compose down

# Restart containers
docker compose restart

# View logs
docker compose logs -f
```

### Update Containers

```bash
# Pull latest images
docker compose pull

# Recreate containers with new images
docker compose up -d --force-recreate
```

---

## 8. Common Issues & Troubleshooting

| Problem | Solution |
|---------|----------|
| Firewall blocking traffic | Open ports in firewall or `ufw` |
| Container won't start | Check `.env` file configuration |
| Logs or stats missing | Use API endpoint `:5000/api/Rist/stats` |
| Permission denied | Ensure Docker daemon is running |

---

## 9. Client Settings

- **Protocol:** RIST
- **Receiver Address:** IP of the RIST relay
- **Receiver Port:** 2030

---

## 10. Disclaimer

- Provided "as is." Minimal support.
- Follow local networking laws.
- Not for commercial resale.
