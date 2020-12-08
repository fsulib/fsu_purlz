#!/bin/sh

source ./purlz.env
rm ./xform.purlz.config
cat ./default.purlz.config \
  | sed "s/_PURLHOST_/$PURLHOST/g" \
  | sed "s/_PURLPORT_/$PURLPORT/g" \
  > xform.purlz.config

docker build \
  --tag purlz:latest \
  .
