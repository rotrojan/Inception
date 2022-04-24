FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

# install all required packages (wget and php) 
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

ARG		USER=nginx

ARG		WP_DIR=/var/www/inception/wordpress

# configure php-fpm
RUN		sed -i 's/;clear_env = no/clear_env = no/ ; s/127.0.0.1/0.0.0.0/ ; s/nobody/nginx/g' \
		/etc/php7/php-fpm.d/www.conf

# create the user for wordpress
RUN		mkdir -p "$WP_DIR" \
		&& addgroup -S "$USER" \
		&& adduser -D -S -G "$USER" -H "$USER" \
		&& chown -R "$USER":"$USER" "$WP_DIR"

# install wp-cli and grants execution rights to the wordpress user
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		-O /usr/local/bin/wp \
		&& chown "$USER" /usr/local/bin/wp \
		&& chown -R "$USER" /etc/php7 /var/log/php7 \
		&& chmod u+x /usr/local/bin/wp

# download wordpress
RUN		wp core download --path="$WP_DIR" --user="$USER"

COPY		run.sh /usr/local/bin/

COPY		wp-config.php "$WP_DIR"

EXPOSE		9000

ENTRYPOINT	["run.sh"]

CMD		["php-fpm7", "--nodaemonize"]
