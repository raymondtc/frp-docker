#!/bin/sh
set -e

if [ ! -f /data/frpc.ini ]; then
  cp /app/frp/frpc.ini /data/
fi

if [ ! -f /data/frpc_full.ini ]; then
  cp /app/frp/frpc_full.ini /data/
fi

exec "$@"