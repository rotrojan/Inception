#!/usr/bin/env sh

# launch mariadb server
mysqld_safe &

# we need to wait for the server to be running before passing it the SQL script
sleep 2
until mysqladmin ping; do
	sleep 1
done

# now let's pass the SQL script
mysql -u root << EOF

# first, we set the password and disable remote connection for the root user
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# and we also delete the empty user for security reasons
DELETE FROM mysql.user WHERE User='';

# then we create the database
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

# we create an admin user and we give him all privileges on the database
CREATE USER '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
FLUSH PRIVILEGES;

EOF

# finaly, we restart mariadb
mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
exec "$@"
