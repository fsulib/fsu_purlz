#!/bin/bash

source ./purlz.env

if [ "$PURLZDB" = 'hsql' ]; then
    VOLUME_CMD="--mount type=bind,src=$PWD/hsql_data,dst=/root/data"
fi

if [ "$PURLZDB" = 'mysql' ]; then
    VOLUME_CMD="--mount type=bind,src=${PWD}/mysql,dst=/usr/local/mysql/var"

    [[ -d ${PWD}/mysql ]] || mkdir -p ${PWD}/mysql 
    
    docker run -d \
        -p $MYSQLPORT:3306 \
        --name $MYSQLCONTAINERNAME \
        "${VOLUME_CMD}" \ 
        -e "MYSQL_ROOT_PASSWORD=$MYSQLROOTPASSWORD" \
        mysql4:latest

    sleep 5

    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "update mysql.user set Grant_priv='Y' where User='root';"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "grant all on *.* TO 'root'@'%';"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "create database $MYSQLDBNAME;"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "grant all on $MYSQLDBNAME.* to '$MYSQLUSERNAME'@'%' identified by '$MYSQLPASSWORD';"
    docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"

fi

docker run \
    -p 80:$PURLPORT \
    $VOLUME_CMD \
    --name $PURLZCONTAINERNAME \
    --env-file purlz.env \
    --add-host mysql:172.17.0.2 \
    --mount type=bind,src=${PWD}/module.xml,dst=/usr/local/purlz/modules/mod-purl-virtualhost/module.xml \
    $PURLZIMAGENAME:$PURLZIMAGETAG
