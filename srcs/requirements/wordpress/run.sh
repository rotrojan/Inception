#!/usr/bin/env sh

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
rm -rf latest.tar.gz
mkdir -p /var/www/html/localhost/
mv /wordpress /var/www/html/localhost/wordpress
mkdir -p /run/php

[ "$DEBUG" -eq 1 ] && exec /bin/bash || exec "$@"
