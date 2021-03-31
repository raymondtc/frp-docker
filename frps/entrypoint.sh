#!/bin/sh
set -e

if [ ! -f /data/frps.ini ]; then
  cp /app/frp/frps.ini /data/
fi

if [ ! -f /data/frps_full.ini ]; then
  cp /app/frp/frps_full.ini /data/
fi

exec "$@"