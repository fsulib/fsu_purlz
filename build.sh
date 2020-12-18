#!/bin/bash

source ./purlz.env

cat ./$PURLZDB.purlz.config \
  | sed "s/_PURLHOST_/$PURLHOST/g" \
  | sed "s/_PURLPORT_/$PURLPORT/g" \
  | sed "s/_MYSQLHOST_/$MYSQLHOST/g" \
  | sed "s/_MYSQLPORT_/$MYSQLPORT/g" \
  | sed "s/_MYSQLDBNAME_/$MYSQLDBNAME/g" \
  | sed "s/_MYSQLUSERNAME_/$MYSQLUSERNAME/g" \
  | sed "s/_MYSQLPASSWORD_/$MYSQLPASSWORD/g" \
  > xform.purlz.config

sed "s/_PURLDNPATTERN_/$PURLDNPATTERN/" ./module.model.xml > ./module.xml

docker build \
  --tag $PURLZIMAGENAME:$PURLZIMAGETAG \
  .
