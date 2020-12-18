#!/bin/bash

source ./purlz.env

docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "update mysql.user set Grant_priv='Y' where User='root';"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "grant all on *.* TO 'root'@'%';"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "create database $MYSQLDBNAME;"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "grant all on $MYSQLDBNAME.* to '$MYSQLUSERNAME'@'%' identified by '$MYSQLPASSWORD';"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "grant all on $MYSQLDBNAME.* TO 'root'@'%';"
docker exec -it $MYSQLCONTAINERNAME /usr/local/mysql/bin/mysql -uroot -p$MYSQLROOTPASSWORD -e "flush privileges;"

