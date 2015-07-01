# import juno base image
FROM compassindocker/juno-base
# install cinder api
RUN touch /etc/init.d/cinder-api && apt-get -y install cinder-api
# expose 8776
EXPOSE 8776
