#!/usr/bin/env sh

chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
# mysql << EOF
# CREATE DATABASE ${MYSQL_DATABASE};
# GRANT ALL ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@${WORDPRESS_DB_HOST} WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# EOF
# mysql_install_db


[ "$DEBUG" -eq 1 ] && exec /bin/bash || exec "$@"
