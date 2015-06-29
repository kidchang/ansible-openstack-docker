# import juno base image
FROM compassindocker/juno-base
# install keystone
RUN apt-get -y install keystone
# delete sqlite databases
RUN rm -rf /var/lib/keystone/keystone.db
# add a cronjob  to purge expired token hourly
RUN (crontab -l -u keystone 2>&1 | grep -q token_flush) || echo '@hourly /usr/bin/keystone-manage token_flush > /var/log/keystone/keystone-tokenflush.log 2>&1' >> /var/spool/cron/crontabs/keystone
# run keystone db-sync
RUN su -s /bin/sh -c "keystone-manage db_sync"
# expose ports
EXPOSE 5000
EXPOSE 35357
