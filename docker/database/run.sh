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

# create database: keystone
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database keystone"
# create database: glance
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database glance"
# create database: neutron
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database neutron"
# create database: ovs_neutron
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database ovs_neutron"
# create database: nova
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database nova"
# create database: cinder
mysql -h${SERVER} --port=${PORT} --u${ROOT_USER} -p${PASSWORD} -e "create database cinder"

service mysql restart
