#!/usr/bin/with-contenv bashio

# Создаём папки внутри постоянного хранилища (смонтировано через map: addon_config:rw)
mkdir -p /config/torrserver/config /config/torrserver/log /config/torrserver/torrents

exec /usr/bin/torrserver \
    --port 8090 \
    --path /config/torrserver/config \
    --logpath /config/torrserver/log/ts.log \
    --weblogpath /config/torrserver/log/tsweb.log \
    --torrentsdir /config/torrserver/torrents \
    --torrentaddr :32000
