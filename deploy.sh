#!/bin/bash

source ./purlz.env

if [ "$PURLZDB" = 'hsql' ]
then
  VOLUME_CMD="--mount type=bind,src=$PWD/hsql_data,dst=/root/data"
fi

if [ "$PURLZDB" = 'mysql' ]
then
  VOLUME_CMD=""

  docker run -d \
  -p $MYSQLPORT:3306 \
  --name $MYSQLCONTAINERNAME \
  --mount type=bind,src=$PWD/mysql_data,dst=/usr/local/mysql/var \
  --ip $MYSQLHOST \
  -e "MYSQL_ROOT_PASSWORD=$MYSQLROOTPASSWORD" \
  stevemayne/mysql4:latest
  
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'update mysql.user set Grant_priv=\'Y\' where User=\'root\';'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'flush privileges;'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'grant all on *.* TO \'root\'@\'%\';'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'flush privileges;'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'create database $MYSQLDBNAME;'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'grant all on $MYSQLDBNAME.* to \'$MYSQLUSERNAME\'@\'%\' identified by \'$MYSQLPASSWORD\';'"
  docker exec -it $MYSQLCONTAINERNAME bash -c "mysql -uroot -p$MYSQLROOTPASSWORD -e 'flush privileges;'"
fi

docker run -d \
  -p 80:$PURLPORT \
  $VOLUME_CMD \
  --name $PURLZCONTAINERNAME \
  --env-file purlz.env \
  $PURLZIMAGENAME:$PURLZIMAGETAG
