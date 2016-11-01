#!/bin/bash
    WORDPRESS_PASSWORD=`pwgen -c -n -1 12`
    #This is so the passwords show up in logs.
    echo "wordpress:$SSH_PASSWORD" | chpasswd
    echo "root:$SSH_PASSWORD" | chpasswd


# start all the services
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
