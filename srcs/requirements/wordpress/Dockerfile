FROM	debian:buster

LABEL	maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y wget php-fpm

RUN		wget https://wordpress.org/latest.tar.gz \
		&& tar -xf latest.tar.gz \
		&& rm -rf latest.tar.gz \
		&& mkdir -p /var/www/html/localhost/ \
		&& mv /wordpress /var/www/html/localhost

RUN		userdel www-data && useradd -u 82 www-data

COPY	./wp-config.php /var/www/html/localhost/wordpress

EXPOSE	 9000

CMD		["php-fpm"]
