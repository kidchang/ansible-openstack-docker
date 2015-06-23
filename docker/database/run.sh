#!/bin/bash

set -e

VOLUME_HOME="/var/lib/mysql"
CONF_FILE="/etc/mysql/conf.d/my.cnf"
LOG="/var/log/mysql/error.log"
ROOT_USER="root"
OLD_PASSWORD="root"
PASSWORD="root"
SERVER="127.0.0.1"
PORT="3306"

chmod 644 ${CONF_FILE}
service mysql restart
sleep 10

mysqladmin -h${SERVER} --port=${PORT} -u ${ROOT_USER} -p "${OLD_PASSWORD}" password ${PASSWORD}

# initialize mysql password
mysqladmin -h${SERVER} --port=${PORT} -u ${ROOT_USER} -p ${PASSWORD}

mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "show databases"
if [[ "$?" != "0" ]]; then
    echo "failed to set mysql password"
    exit 1
else
    echo "successfully set mysql password"
fi

service mysql restart
