FROM		debian:buster

LABEL		maintainer="rotrojan <rotrojan@student.42.fr>"

RUN			apt-get update && apt-get upgrade -y

RUN			apt-get install -y wget php php-fpm php-mysql php-xml php-mbstring

COPY		./wp-config.php /tmp

COPY		run.sh /usr/local/bin/

ENTRYPOINT	["run.sh"]

CMD			["php-fpm7.3", "--nodaemonize"]
