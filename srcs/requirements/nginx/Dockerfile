FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk update && apk upgrade && apk add --no-cache nginx

COPY		nginx.conf /etc/nginx/http.d/default.conf

EXPOSE		80

CMD		["/usr/sbin/nginx", "-g", "daemon off;"]
