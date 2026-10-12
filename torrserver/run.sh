#!/usr/bin/with-contenv bashio

mkdir -p /opt/torrserver/config /opt/torrserver/log /opt/torrserver/torrents

exec /usr/bin/torrserver \
    --port 8090 \
    --path /opt/torrserver/config \
    --logpath /opt/torrserver/log/ts.log \
    --weblogpath /opt/torrserver/log/tsweb.log \
    --torrentsdir /opt/torrserver/torrents \
    --torrentaddr :32000
