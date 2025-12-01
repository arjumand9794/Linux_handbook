#!/bin/bash
SRC="/opt/myapp"
DEST="/backup/myapp"
TS=$(date +%F-%H-%M-%S)
mkdir -p $DEST
tar -czf $DEST/myapp-$TS.tar.gz $SRC
find $DEST -mtime +7 -delete
