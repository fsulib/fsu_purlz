#!/bin/sh

source ./purlz.env

docker run -d \
  -p $PURLPORT:$PURLPORT \
  -v $(pwd)/purlz_data:/root/purlz_data \
  --name $PURLZCONTAINERNAME \
  --env-file purlz.env \
  purlz:latest
