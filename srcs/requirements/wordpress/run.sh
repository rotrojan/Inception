#!/usr/bin/env sh

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
rm -rf latest.tar.gz
mkdir -p /var/www/html/localhost/
mv /tmp/wp-config.php /wordpress/
mv /wordpress/ /var/www/html/localhost/wordpress/
mkdir -p /run/php
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

[ "$DEBUG" -eq 1 ] && exec /bin/bash || exec "$@"
