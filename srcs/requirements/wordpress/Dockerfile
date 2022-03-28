FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y wget \
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

COPY		wp-config.php /tmp

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD		["php-fpm7.3", "--nodaemonize"]
