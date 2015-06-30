# import juno base image
FROM compassindocker/juno-base
# install nova-novncproxy
RUN touch /etc/init.d/nova-novncproxy && apt-get -y install nova-novncproxy
# expose ports
EXPOSE 6080
