ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache ca-certificates tzdata unzip

ARG BUILD_ARCH=amd64
ARG TS_VERSION=MatriX.146.UN

RUN case "${BUILD_ARCH}" in \
        amd64)   TS_ARCH=amd64; FFPROBE_URL="https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffprobe-6.1-linux-64.zip" ;; \
        aarch64) TS_ARCH=arm64; FFPROBE_URL="https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffprobe-6.1-linux-arm-64.zip" ;; \
        armv7)   TS_ARCH=arm7;  FFPROBE_URL="https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffprobe-6.1-linux-armhf-32.zip" ;; \
        *)       echo "Unsupported arch: ${BUILD_ARCH}" >&2; exit 1 ;; \
    esac && \
    wget -q -O /tmp/ffprobe.zip "${FFPROBE_URL}" && \
    unzip -q /tmp/ffprobe.zip -d /tmp/ && \
    mv /tmp/ffprobe /usr/bin/ffprobe && \
    chmod +x /usr/bin/ffprobe && \
    rm -rf /tmp/ffprobe.zip && \
    wget -O /usr/bin/torrserver \
        "https://github.com/bylampa/Matrix/releases/download/${TS_VERSION}/TorrServer-linux-${TS_ARCH}" && \
    chmod +x /usr/bin/torrserver

RUN mkdir -p /opt/torrserver/config /opt/torrserver/log /opt/torrserver/torrents

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8090
CMD [ "/run.sh" ]
