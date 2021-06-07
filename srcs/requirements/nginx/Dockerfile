FROM	debian:buster

LABEL	maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y nginx

COPY	localhost /etc/nginx/sites-available/

RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled \
		&& mkdir -p /var/www/html/localhost/ \
		&& chown -R www-data /var/www/html/localhost/ \
		&& chmod -R 755 /var/www/html/localhost/

EXPOSE	80
CMD		["nginx", "-g", "daemon off;"]
