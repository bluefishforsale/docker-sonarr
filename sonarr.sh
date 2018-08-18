#!/usr/bin/env bash

SERVICE="sonarr"
IMAGE="bluefishforsale/sonarr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
DOWNLOADS="/data01/incoming/tv"
COMPLETE="/data01/complete/tv"

docker stop ${SERVICE}
docker rm ${SERVICE}


sudo docker run -d \
  --cpus=2 \
  --restart=always \
  --name=${SERVICE} \
  --hostname=${HOSTNAME} \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=1001 -e PGID=1001 \
  -p 8902:8989 \
  -v ${LOCALDIR}:/config \
  -v ${DOWNLOADS}:/downloads \
  -v ${COMPLETE}:/tv \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
