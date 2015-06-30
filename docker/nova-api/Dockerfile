# import juno base image
FROM compassindocker/juno-base
# install nova-api
RUN touch /etc/init.d/nova-api && apt-get -y install nova-api
# expose ports
EXPOSE 8773
EXPOSE 8774
EXPOSE 8775
