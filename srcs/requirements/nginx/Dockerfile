FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN			apt-get update && apt-get upgrade -y

RUN			apt-get install -y nginx

COPY		nginx.conf /etc/nginx/sites-available/localhost

RUN			ln -s /etc/nginx/sites-available/localhost \
				/etc/nginx/sites-enabled \
			&& mkdir -p /var/www/html/localhost/ \
			&& chown -R www-data /var/www/html/localhost/ \
			&& chmod -R 755 /var/www/html/localhost/

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

EXPOSE		80

CMD			["/usr/sbin/nginx", "-g", "daemon off;"]
