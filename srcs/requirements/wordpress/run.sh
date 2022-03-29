#!/usr/bin/env sh

wp db create --path=$WP_DIR --allow-root
#wp core install --url=localhost --title=my_awesome_wordpress --admin-user=db_username --admin-pass=db_password --allow-root

#echo "<?php phpinfo(); ?>" > /var/www/html/localhost/wordpress/phpinfo.php

# maybe enable communication between mariadb and wordpress
#echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

[ "$DEBUG" = 1 ] && exec /bin/bash || exec "$@"
