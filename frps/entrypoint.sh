#!/bin/sh
set -e

if [ ! -f /data/frps.ini ]; then
  cp /app/frp/frps.ini /data/
fi

exec "$@"