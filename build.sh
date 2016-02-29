#!/bin/bash

set -e

ARCH=${1:-armv7l}

docker build -t influxdb-build -f Dockerfile-${ARCH}.build .

docker rm influxdb-build || true
docker run --name influxdb-build influxdb-build /output

[ -d output ] || mkdir output
docker cp influxdb-build:/output/influxd output

docker build -t larsla/influxdb-${ARCH} -f Dockerfile-${ARCH} .
