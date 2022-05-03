FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk update && apk upgrade && apk add --no-cache nginx openssl

# create the certificate for secure connection
RUN		mkdir -p /etc/nginx/ssl/ \
		&& openssl req -x509 -out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key -newkey rsa:2048 -nodes -sha256 \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=rotrojan/CN=rotrojan.42.fr"

# load nginx configuration
COPY		nginx.conf /etc/nginx/http.d/default.conf

CMD		["nginx", "-g", "daemon off;"]
