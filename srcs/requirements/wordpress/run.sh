#!/usr/bin/env sh

#[ "wp core is-installed --path=/var/www/inception/wordpress/" = 0 ]
wp core install \
	--path=/var/www/inception/wordpress \
	--url=rotrojan.42.fr \
	--admin_user=roycampbell \
	--admin_email=roycampbell@foxhound.gov \
	--title=Inception

exec "$@"
