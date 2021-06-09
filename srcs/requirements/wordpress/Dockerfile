FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN			apt-get update && apt-get upgrade -y

RUN			apt-get install -y wget php php-fpm php-mysql php-xml php-mbstring

RUN			wget https://wordpress.org/latest.tar.gz \
			&& tar -xf latest.tar.gz \
			&& rm -rf latest.tar.gz \
			&& mkdir -p /var/www/html/localhost/ \
			&& mv /wordpress /var/www/html/localhost \
			&& mkdir -p /run/php

COPY		./wp-config.php /var/www/html/localhost/wordpress

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD			["php-fpm7.3", "--nodaemonize"]
