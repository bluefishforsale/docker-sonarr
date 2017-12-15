#!/bin/bash

BUILD=latest
SERVICE=sonarr
USER=bluefishforsale

docker build --pull --tag ${USER}/${SERVICE}:${BUILD} .
