#!/bin/bash
# Add system user for Wordpress

useradd -m -d /home/$USER -G root -s /bin/bash $USER \
	&& usermod -a -G $USER $USER \
	&& usermod -a -G sudo $USER

# Set passwords for the ssh user and root
echo "$USER:$SSH_PASSWORD" | chpasswd
echo "root:$SSH_PASSWORD" | chpasswd


# start all the services
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
