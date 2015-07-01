# import juno base image
FROM compassindocker/juno-base
# install neutron server
RUN touch /etc/init.d/neutron-server && apt-get -y install neutron-server
# expose 9696
EXPOSE 9696
