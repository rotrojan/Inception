#!/bin/bash

mkdir -p /run/mysqld
chown mysql:mysql -R /run/mysqld/
chown mysql:mysql -R /var/lib/mysql/
mysql_install_db

[ "$DEBUG" == 1 ] && exec /bin/bash || "$@"
