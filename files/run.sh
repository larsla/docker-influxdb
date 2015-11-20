#!/bin/bash

CONFIG="${CONFIG:-/etc/influxdb.conf}"

ARGS="-config $CONFIG -hostname $HOSTNAME"

if [ -n "$JOIN" ]; then
	ARGS="$ARGS -join $JOIN"
fi

/influxd $ARGS
