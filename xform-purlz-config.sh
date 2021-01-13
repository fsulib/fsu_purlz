#!/usr/bin/env bash

# Substitute CodeBuild environment variables for placeholder values.

[[ -f purlz-install.config ]] || exit 1

sed -i \
    -e "9s/_PURLPORT_/${PURLZ_PORT}/" \
    -e "10s/_PURLHOST_/${PURLZ_HOST}/" \
    -e "20s/_MYSQLHOST_/${PURLZ_DB_HOST}/" \
    -e "21s/_MYSQLPORT_/${PURLZ_DB_PORT}/" \
    -e "22s/_MYSQLDBNAME_/${PURLZ_DB_NAME}/" \
    -e "23s/_MYSQLUSERNAME_/${PURLZ_DB_USERNAME}/" \
    -e "24s/_MYSQLPASSWORD_/${PURLZ_DB_PASSWORD}/" \
    purlz-install.config

cat purlz-install.config
