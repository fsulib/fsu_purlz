#!/bin/bash

source ./purlz.env

if [ "$PURLZDB" = 'hsql' ]
then
  VOLUME_CMD="--mount type=bind,src=$PWD/hsql_data,dst=/root/data"
fi

if [ "$PURLZDB" = 'mysql' ]
then
  VOLUME_CMD=""
fi

docker run -d \
  -p $PURLPORT:$PURLPORT \
  $VOLUME_CMD \
  --name $PURLZCONTAINERNAME \
  --env-file purlz.env \
  $PURLZIMAGENAME:$PURLZIMAGETAG
