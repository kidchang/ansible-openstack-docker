# this is a base image for all openstack containers
From ubuntu:trusty

# add ubuntu cloud keyring
RUN apt-get -y update && apt-get install -y ubuntu-cloud-keyring

# add openstack juno repo to the apt source list
ADD cloudarchive-juno.list /etc/apt/sources.list.d/cloudarchive-juno.list

# upgrade packages
RUN apt-get -y update && apt-get -y dist-upgrade
