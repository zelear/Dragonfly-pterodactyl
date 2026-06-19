# ----------------------------------
# Environment: dragonfly
# ----------------------------------
FROM    --platform=$TARGETOS/$TARGETARCH ghcr.io/dragonflydb/dragonfly:latest

LABEL   author="ZelearFox" maintainer="fox@zlr.su"
LABEL org.opencontainers.image.source="https://github.com/zelear/Dragonfly-pterodactyl"

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt -y update && \
        apt -y upgrade && \
        apt -y install iproute2 && \
        useradd -d /home/container -m container -s /bin/bash

USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
