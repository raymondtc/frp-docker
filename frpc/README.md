# [raymond17/frpc](https://github.com/raymondtc/frp-docker/tree/main/frpc)

[Frp](https://github.com/fatedier/frp) is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.

frp also has a P2P connect mode.

## Usage

Here are some example snippets to help you get started creating a container.

The file ```frpc.ini``` will be generated in ```/path/to/data``` when starting the container if not exists, which contains some frequently used example configurations.

### docker-compose

Compatible with docker-compose v2 schemas.

```yaml
---
version: "2.1"
services:
  frpc:
    image: raymond17/frpc
    container_name: frpc
    network_mode: host
    environment:
      - TZ=Asia/Shanghai
        # frpc.ini server_addr
      - FRP_SERVER_ADDR=127.0.0.1
        # frps.ini server_port
      - FRP_SERVER_PORT=7000
        # frps.ini token
      - FRP_TOKEN=
    volumes:
      - /path/to/data:/data
    restart: unless-stopped
```

### docker cli

```shell
docker run -d \
  --name=frpc \
  -e FRP_SERVER_ADDR=127.0.0.1 \
  -e FRP_SERVER_PORT=7000 \
  -e FRP_TOKEN= \
  --network host \
  -v /path/to/data:/data \
  --restart unless-stopped \
  raymond17/frpc
```
