FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk update \
		&& apk upgrade \
		&& apk add --no-cache mariadb mariadb-client

RUN		mkdir -p /run/mysqld /var/lib/mysql \
		&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
		&& mariadb-install-db --skip-test-db --user=mysql --datadir=/var/lib/mysql

RUN		sed -i 's/skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD		["mysqld_safe"]
