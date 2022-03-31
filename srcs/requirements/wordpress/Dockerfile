FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y wget \
			mariadb-client \
			php-fpm \
			php-curl \
			php-gd \
			php-intl \
			php-mbstring \
			php-soap \
			php-xml \
			php-xmlrpc \
			php-zip \
			php-mysqli \
			php-phar

RUN		mkdir -p /run/php

#install wp-cli
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		-O /usr/local/bin/wp \
		&& chmod u+x /usr/local/bin/wp

ARG		WP_DIR=/var/www/html/localhost/wordpress

# download wordpress
RUN		mkdir -p $WP_DIR && wp core download --path=$WP_DIR --user=www-data --allow-root \
		&& chown -R www-data:www-data $WP_DIR

COPY		wp-config.php $WP_DIR

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD		["php-fpm7.3", "--nodaemonize"]
