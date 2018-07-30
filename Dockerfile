FROM ubuntu:16.04
MAINTAINER Prime-Host <info@prime-host.de>

# Keep upstart from complaining
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -sf /bin/true /sbin/initctl
#RUN mkdir /var/run/sshd

# Let the conatiner know that there is no tty
#ENV DEBIAN_FRONTEND noninteractive

# Install all packages
RUN apt-get update && \
apt-get install -y --no-install-recommends cron python-setuptools curl git nano vim sudo unzip openssh-server openssl sendmail zsh && \
rm -rf /var/lib/apt/lists/*

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN sed -i s:/root/.oh-my-zsh:\$HOME/.oh-my-zsh:g /root/.zshrc && sed -i 's/robbyrussell/bira/g' /root/.zshrc && echo "DISABLE_UPDATE_PROMPT=true" >> /root/.zshrc
RUN cp -r /root/.oh-my-zsh /etc/skel/
RUN cp /root/.zshrc /etc/skel

# use default sendmail config
RUN yes 'y' | sendmailconfig

# Supervisor Config
RUN /usr/bin/easy_install supervisor && /usr/bin/easy_install supervisor-stdout
COPY ./supervisord.conf /etc/supervisord.conf

# Initialization and Startup Script
RUN mkdir /root/container-scripts /root/container-scripts/prime-host /root/container-scripts/custom
COPY ./ubuntu-start.sh /root/container-scripts/prime-host/ubuntu-start.sh
RUN chmod 755 /root/container-scripts/prime-host/ubuntu-start.sh

# network ports
EXPOSE 22

CMD ["/bin/bash", "/root/container-scripts/prime-host/ubuntu-start.sh"]
