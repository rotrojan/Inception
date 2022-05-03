#!/usr/bin/env sh

sleep 5
until mysqladmin -u roycampbell --password=roycampbell_password -h mariadb ping; do
	sleep 1
done

if [ ! "wp core is-installed --path=/var/www/inception/wordpress/" = 0 ]; then
	wp config create \
		--path=${WP_DIR} \
		--dbname=${MYSQL_DATABASE} \
		--dbhost=mariadb \
		--dbuser=${MYSQL_ADMIN} \
		--dbpass=${MYSQL_ADMIN_PASSWORD}
	wp core install \
		--path=${WP_DIR} \
		--url=${WP_URL} \
		--admin_user=${MYSQL_ADMIN} \
		--admin_password=${MYSQL_ADMIN_PASSWORD} \
		--admin_email=roycampbell@foxhound.gov \
		--skip-email \
		--title=Inception
	wp user create ${WP_USER} ${WP_USER_EMAIL} \
		--path=${WP_DIR} \
		--user_pass=${WP_USER_PASSWORD}
fi

exec "$@"
