#!/bin/sh
set -e

if [ ! -f /data/frpc.ini ]; then
  cp /app/frp/frpc.ini /data/
fi

exec "$@"