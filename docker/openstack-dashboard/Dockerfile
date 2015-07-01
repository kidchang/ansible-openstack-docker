# import juno base mage
FROM compassindocker/juno-base
# install dashboard packages
RUN apt-get install -y apache2 memcached libapache2-mod-wsgi openstack-dashboard
# remove ubuntu default openstack theme
RUN apt-get purge -y openstack-dashboard-ubuntu-theme
# expose ports
EXPOSE 80
EXPOSE 11211
