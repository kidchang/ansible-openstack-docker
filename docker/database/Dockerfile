# database contanier doesn't need to be juno-based
From ubuntu:trusty
# run updates first
RUN apt-get -y update && apt-get -y dist-upgrade
# install packages
RUN apt-get install python-mysqldb mysql-server
# clean up mysql lib
RUN rm -rf /var/lib/mysql/*
# add conf file
ADD my.cnf /etc/mysql/my.cnf

