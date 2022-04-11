FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk update && apk upgrade && apk add --no-cache nginx
RUN		apk add --no-cache bash


#COPY		nginx.conf /etc/nginx/sites-available/localhost
COPY		nginx.conf /etc/nginx/http.d/default.conf

#RUN		mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled \
#		&& ln -s /etc/nginx/sites-available/localhost \
#			/etc/nginx/sites-enabled \
#		&& mkdir -p /var/www/html/localhost/ \
#		&& chmod -R 755 /var/www/html/localhost/

#COPY		run.sh /usr/local/bin/

#ENTRYPOINT	["run.sh"]
#RUN		mkdir -p /run/nginx

EXPOSE		80

CMD		["/usr/sbin/nginx", "-g", "daemon off;"]
