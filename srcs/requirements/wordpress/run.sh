#!/usr/bin/env sh

sleep 5
until mysqladmin -u roycampbell --password=roycampbell_password -h mariadb ping; do
	sleep 1
done
wp core is-installed --path=/var/www/inception/wordpress/ ||
#wp core install \
#	--path=/var/www/inception/wordpress \
#	--url=rotrojan.42.fr \
#	--admin_user=roycampbell \
#	--admin_password=roycampbell_password \
#	--admin_email=roycampbell@foxhound.gov \
#	--skip-email \
#	--title=Inception

exec "$@"
