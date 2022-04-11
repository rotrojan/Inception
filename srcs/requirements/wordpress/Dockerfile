FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

# 
RUN		apk add --no-cache wget \
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
			php-json \
			php-phar

RUN		apk add bash

ARG		USER=wordpress

ARG		WP_DIR=/var/www/html/localhost/wordpress

RUN		mkdir -p "$WP_DIR" \
		&& addgroup -S "$USER" && adduser -D -S -G "$USER" -h "$WP_DIR" "$USER"


# install wp-cli and grants exectution rights to www-data
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		-O /usr/local/bin/wp \
		&& chown -R "$USER" /usr/local/bin/wp \
		&& chown -R "$USER" /etc/php7 /var/log/php7 \
		&& chmod u+x /usr/local/bin/wp

USER		"$USER"

COPY		wp-config.php "$WP_DIR"

# download wordpress
RUN		wp core download --path="$WP_DIR" --user="$USER"

COPY		run.sh /usr/local/bin/

EXPOSE		9000

#ENTRYPOINT	["run.sh"]

CMD		["php-fpm7", "--nodaemonize"]
