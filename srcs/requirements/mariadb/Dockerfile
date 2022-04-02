FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk add --no-cache mariadb

COPY		run.sh /usr/local/bin/

EXPOSE		3306

COPY		50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#USER		www-data

ENTRYPOINT	["run.sh"]

CMD		["tail", "-f"]
