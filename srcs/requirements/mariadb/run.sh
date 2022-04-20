#!/usr/bin/env sh

mysqld_safe &

sleep 2
until mysqladmin ping; do
	sleep 1
done

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
USE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE TO '$MYSQL_USER'@'locahost' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF
mysqladmin shutdown
exec "$@"
