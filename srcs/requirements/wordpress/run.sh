#!/usr/bin/env sh

# we need to wait for mariadb to be running before installing wordpress
sleep 5
until mysqladmin -u roycampbell --password=roycampbell_password -h mariadb ping; do
	sleep 1
done

# first, we check if the wp-config.php file exists
# if it does, the installation is already done, no need to do it again
# if it does not, we install wordpress using wp-cli
if [ ! -f ${WP_DIR}/wp-config.php ]; then

# we create the wp-config.php which is the wordpress configuration file
	wp config create \
		--path=${WP_DIR} \
		--dbname=${MYSQL_DATABASE} \
		--dbhost=mariadb \
		--dbuser=${MYSQL_ADMIN} \
		--dbpass=${MYSQL_ADMIN_PASSWORD}
			
# since the database is already created, we can now directly install wordpress
	wp core install \
		--path=${WP_DIR} \
		--url=${WP_URL} \
		--admin_user=${MYSQL_ADMIN} \
		--admin_password=${MYSQL_ADMIN_PASSWORD} \
		--admin_email=roycampbell@foxhound.gov \
		--skip-email \
		--title=Inception

# and we create a wordpress user
	wp user create ${WP_USER} ${WP_USER_EMAIL} \
		--path=${WP_DIR} \
		--user_pass=${WP_USER_PASSWORD}
fi

# finally, we launch the php-fpm daemon
exec "$@"
