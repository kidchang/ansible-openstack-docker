# import juno base image
FROM compassindocker/juno-base
# install neutron server
RUN touch /etc/init.d/neutron-server && apt-get -y install neutron-server neutron-plugin-ml2
# expose 9696
EXPOSE 9696
