#!/usr/bin/env sh

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql
mysql_install_db --defaults-file=~/.my.cnf
# service mysql start
mysql --user=root << _EOF_
UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_
mysql << _EOF_

_EOF_
service mysql stop


[ "$DEBUG" -eq 1 ] && exec /bin/bash || exec "$@"
