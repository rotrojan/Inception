FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y mariadb-server

COPY		run.sh /usr/local/bin/

EXPOSE		3306

COPY		50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT	["run.sh"]

#CMD		["mysqld"]
