FROM ubuntu:focal

LABEL maintainer="raymondtc"

ARG FRP_VERSION=

ENV DEBIAN_FRONTEND=noninteractive

COPY entrypoint.sh /

RUN \
 chmod +x /entrypoint.sh && \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
    curl && \
    rm -rf /var/lib/apt/lists/* && \
 echo "**** install frp ****" && \
 mkdir -p /app/frp/bin /tmp/frp && \
 curl -Lo \
    /tmp/frp.tar.gz \
    "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz" && \
 tar xf \
    /tmp/frp.tar.gz -C \
    /tmp/frp --strip-components=1 && \
 mv /tmp/frp/frpc /app/frp/bin && \
 rm -rf /tmp/frp /tmp/frp.tar.gz

COPY frpc.ini /app/frp

VOLUME [ "/data" ]

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/app/frp/bin/frpc", "-c", "/data/frpc.ini" ]