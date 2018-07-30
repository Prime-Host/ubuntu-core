FROM ubuntu:16.04
MAINTAINER Prime-Host <info@nordloh-webdesign.de>

# Keep upstart from complaining
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -sf /bin/true /sbin/initctl
#RUN mkdir /var/run/sshd

# Let the conatiner know that there is no tty
#ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install cron pwgen python-setuptools curl git nano vim sudo unzip dos2unix openssh-server openssl sendmail zsh

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN sed -i s:/root/.oh-my-zsh:\$HOME/.oh-my-zsh:g /root/.zshrc && sed -i 's/robbyrussell/bira/g' /root/.zshrc && echo "DISABLE_UPDATE_PROMPT=true" >> /root/.zshrc
RUN cp -r /root/.oh-my-zsh /etc/skel/
RUN cp /root/.zshrc /etc/skel

# clean up unneeded packages
RUN apt-get --purge autoremove -y

# use default sendmail config
RUN yes 'y' | sendmailconfig

# Supervisor Config
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout
ADD ./supervisord.conf /etc/supervisord.conf

# Initialization and Startup Script
RUN mkdir /root/container-scripts
RUN mkdir /root/container-scripts/prime-host
RUN mkdir /root/container-scripts/custom
ADD ./ubuntu-start.sh /root/container-scripts/prime-host/ubuntu-start.sh
RUN chmod 755 /root/container-scripts/prime-host/ubuntu-start.sh

# network ports
EXPOSE 22

CMD ["/bin/bash", "/root/container-scripts/prime-host/ubuntu-start.sh"]
