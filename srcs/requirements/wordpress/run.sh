#!/usr/bin/env sh

wget /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

WP_DIR = /var/www/html/localhost/wordpress

mkdir -p $(WP_DIR)
cd $(WP_DIR)
wp core download --path=$(WP_DIR) --locale=en_US --allow-root
chmod -R $(WP_DIR) 600
#mv /tmp/wp-config.php $(WP_DIR)/wordpress/
mkdir -p /run/php

#echo "<?php phpinfo(); ?>" > /var/www/html/localhost/wordpress/phpinfo.php

# maybe enable communication between mariadb and wordpress
#echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

[ "$DEBUG" -eq 1 ] && exec /bin/bash || exec "$@"
