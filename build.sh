#!/bin/bash

set -e

ARCH=${1:-x86_64}

docker build -t influxdb-build -f Dockerfile-${ARCH}.build .

mkdir output
docker run -it -v $PWD/output:/output influxdb-build

docker build -t larsla/influxdb -f Dockerfile-${ARCH} .
