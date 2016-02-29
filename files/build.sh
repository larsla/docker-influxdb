#!/bin/bash

set -e

if [ -z "$1" ]; then
	echo "Usage: $0 <output dir>"
	exit 1
fi

export GOPATH=/go
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

mkdir -p $GOPATH/bin

go get github.com/influxdata/influxdb
cd $GOPATH/src/github.com/influxdata/
go get ./...
go install ./...

cp `which influxd` $1
