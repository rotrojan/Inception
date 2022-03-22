FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y mariadb-server

COPY		run.sh /usr/local/bin/

EXPOSE		3306

ENTRYPOINT	["run.sh"]

CMD		["mysqld_safe"]
