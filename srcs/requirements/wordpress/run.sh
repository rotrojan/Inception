#!/usr/bin/env sh

#wp core install --url=localhost --title=my_awesome_wordpress --admin-user=db_username --admin-pass=db_password
#wp db create --path=$WP_DIR --allow-root

#echo "<?php phpinfo(); ?>" > /var/www/html/localhost/wordpress/phpinfo.php

# maybe enable communication between mariadb and wordpress
#echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"
