ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache ca-certificates tzdata

# Скачиваем ваш бинарник из релиза bylampa/Matrix
ARG BUILD_ARCH=amd64
RUN wget -O /usr/bin/torrserver \
    "https://github.com/bylampa/Matrix/releases/download/MatriX.146.UN/TorrServer-linux-${BUILD_ARCH}" \
    && chmod +x /usr/bin/torrserver

RUN mkdir -p /opt/torrserver/config /opt/torrserver/log /opt/torrserver/torrents

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8090
CMD [ "/run.sh" ]
