FROM ubuntu:20.04
MAINTAINER Nordloh <info@nordloh-webdesign.de>
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install oh-my-zsh, sendmail and supervisor | custom config for oh-my-zsh, vim and new created users
RUN mkdir /var/run/sshd \
 && apt-get update \
 && apt-get install -y cron python-setuptools supervisor wget curl git nano vim sudo unzip openssh-server openssl zsh \
 && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
 && cp /root/.oh-my-zsh/themes/bira.zsh-theme /root/.oh-my-zsh/themes/prime-host.zsh-theme \
 && sed -i 's/%m/%M/g' /root/.oh-my-zsh/themes/prime-host.zsh-theme \
 && sed -i s:/root/.oh-my-zsh:\$HOME/.oh-my-zsh:g /root/.zshrc \
 && sed -i 's/robbyrussell/prime-host/g' /root/.zshrc \
 && echo "DISABLE_UPDATE_PROMPT=true" >> /root/.zshrc \
 && echo "set encoding=utf-8" >> /root/.vimrc \
 && echo "set fileencoding=utf-8" >> /root/.vimrc \
 && cp -r /root/.oh-my-zsh /etc/skel/. \
 && cp /root/.zshrc /etc/skel/. \
 && cp /root/.vimrc /etc/skel/. 

# Supervisor Config
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Initialization and Startup Script
COPY ./ubuntu-start.sh /bin/prime-host/ubuntu-start.sh

# network ports
EXPOSE 22

CMD ["/bin/bash", "/bin/prime-host/ubuntu-start.sh"]
