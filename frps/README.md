# [raymond17/frps](https://github.com/raymondtc/frp-docker/tree/main/frps)

[Frp](https://github.com/fatedier/frp) is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.

frp also has a P2P connect mode.

## Usage

Here are some example snippets to help you get started creating a container.

The frps.ini file will be generated in /path/to/data when starting the container if not exists.

### docker-compose

Compatible with docker-compose v2 schemas.

```yaml
---
version: "2.1"
services:
  frps:
    image: raymond17/frps
    container_name: frps
    network_mode: host
    environment:
      - TZ=Asia/Shanghai
        # frps.ini bind_addr
      - FRP_BIND_ADDR=0.0.0.0
        # frps.ini bind_port
      - FRP_BIND_PORT=7000
        # frps.ini token
      - FRP_TOKEN=
    volumes:
      - /path/to/data:/data
    restart: unless-stopped
```

### docker cli

```shell
docker run -d \
  --name=frps \
  -e FRP_BIND_ADDR=0.0.0.0 \
  -e FRP_BIND_PORT=7000 \
  -e FRP_TOKEN= \
  --network host \
  -v /path/to/data:/data \
  --restart unless-stopped \
  raymond17/frps
```
