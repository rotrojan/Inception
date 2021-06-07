FROM	debian:buster

LABEL	maintainer="rotrojan <rotrojan@student.42.fr>"

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y mariadb-server

RUN		userdel mysql && useradd -u 999 mysql

EXPOSE	3306

CMD		["mysqld"]
