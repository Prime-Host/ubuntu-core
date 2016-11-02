#!/bin/bash
# Add system user for Wordpress

useradd -m -d /home/wordpress -p $(openssl passwd -1 'wordpress') -G root -s /bin/bash wordpress \
    && usermod -a -G www-data wordpress \
    && usermod -a -G sudo wordpress \
    && ln -s /usr/share/nginx/www /home/wordpress/www

    WORDPRESS_PASSWORD=`pwgen -c -n -1 12`
    #This is so the passwords show up in logs.
    echo "wordpress:$SSH_PASSWORD" | chpasswd
    echo "root:$SSH_PASSWORD" | chpasswd


# start all the services
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
