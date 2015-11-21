#!/bin/bash

set -e

ARCH=${1:-x86_64}

docker build -t influxdb-build -f Dockerfile-${ARCH}.build .

CID=`docker run influxdb-build /output`

[ -d output ] || mkdir output
docker cp $CID:/output/influxd output

docker rm $CID

docker build -t larsla/influxdb-${ARCH} -f Dockerfile-${ARCH} .
