FROM ubuntu:16.04
MAINTAINER Prime-Host <info@nordloh-webdesign.de>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
RUN mkdir /var/run/sshd

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install pwgen python-setuptools curl git nano vim sudo unzip dos2unix openssh-server openssl

# clean up unneeded packages
RUN apt-get --purge autoremove -y

# Supervisor Config
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout
ADD ./supervisord.conf /etc/supervisord.conf

# Initialization and Startup Script
RUN mkdir /root/container-scripts
RUN mkdir /root/container-scripts/old
RUN mkdir /root/container-scripts/active
ADD ./ubuntu-start.sh /root/container-scripts/old/ubuntu-start.sh
RUN chmod 755 /root/container-scripts/old/ubuntu-start.sh

# network ports
EXPOSE 22

CMD ["/bin/bash", "/root/container-scripts/old/ubuntu-start.sh"]
