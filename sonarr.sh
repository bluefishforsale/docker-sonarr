#!/usr/bin/env bash

SERVICE="sonarr"
IMAGE="linuxserver/sonarr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
DOWNLOADS="/data01/incoming/tv"
COMPLETE="/data01/complete/tv"

test  -d ${LOCALDIR}  || mkdir -p ${LOCALDIR}

docker stop ${SERVICE}
docker rm ${SERVICE}


sudo docker run -d \
  --restart=always \
  --name=${SERVICE} \
  --hostname=${HOSTNAME} \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=1001 -e PGID=1001 \
  -p 8989:8989 \
  -v ${LOCALDIR}:/config \
  -v ${DOWNLOADS}:/downloads \
  -v ${COMPLETE}:/tv \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
