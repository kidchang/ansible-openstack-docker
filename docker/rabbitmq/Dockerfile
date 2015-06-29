# rabbitmq container doesn't need to be juno-based
From ubuntu:trusty
# run updates first
RUN apt-get -y update && apt-get -y dist-upgrade
# install packages
RUN apt-get -y install rabbitmq-server
# expose 5672
EXPOSE 5672
