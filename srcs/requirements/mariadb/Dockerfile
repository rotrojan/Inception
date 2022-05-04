FROM		alpine:3.14

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apk update \
		&& apk upgrade \
		&& apk add --no-cache mariadb mariadb-client

# we give to the mysql user the rights on mariadb
# then `mariadb-install-db` initialize the MariaDB data directory and creates the system tables in the mysql database
RUN		mkdir -p /run/mysqld /var/lib/mysql \
		&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
		&& mariadb-install-db --skip-test-db --user=mysql --datadir=/var/lib/mysql

# in the mariadb configuration file, we disable the skip-networking directive on mysqld
# this will allows us to commmunicate with the mariadb daemon via another container
RUN		sed -i 's/skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD		["mysqld_safe"]
