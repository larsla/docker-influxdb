#!/bin/bash

set -e

if [ ! $1 ]; then
	echo "Usage: $0 <output dir>"
	exit 1
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
mkdir -p $GOBIN

export PATH=$PATH:$GOBIN

go get github.com/influxdb/influxdb
cd $GOPATH/src/github.com/influxdb/
go get ./...
go install ./...

cp `which influxd` $1
