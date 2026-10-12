ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache ca-certificates tzdata

# Маппинг архитектур HA -> имена файлов в релизах bylampa/Matrix
ARG BUILD_ARCH=amd64
RUN case "${BUILD_ARCH}" in \
        amd64)   TS_ARCH=amd64 ;; \
        aarch64) TS_ARCH=arm64 ;; \
        armv7)   TS_ARCH=arm7  ;; \
        *)       echo "Unsupported arch: ${BUILD_ARCH}" >&2; exit 1 ;; \
    esac && \
    wget -O /usr/bin/torrserver \
        "https://github.com/bylampa/Matrix/releases/download/MatriX.146.UN/TorrServer-linux-${TS_ARCH}" && \
    chmod +x /usr/bin/torrserver

RUN mkdir -p /opt/torrserver/config /opt/torrserver/log /opt/torrserver/torrents

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8090
CMD [ "/run.sh" ]
