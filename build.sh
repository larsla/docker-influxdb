#!/bin/bash

set -e

ARCH=${1:-x86_64}

docker build -t influxdb-build -f Dockerfile-${ARCH}.build .

[ -d output ] || mkdir output
docker run -v $PWD/output:/output influxdb-build

docker build -t larsla/influxdb-${ARCH} -f Dockerfile-${ARCH} .
