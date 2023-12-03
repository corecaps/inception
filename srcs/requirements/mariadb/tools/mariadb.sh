#!/bin/sh
/etc/init.d/mariadb start
mysql_secure_installation << __EOF
Y
Y


Y
Y
Y
Y
__EOF
mysql -e "CREATE DATABASE IF NOT EXISTS testdb;"
mysql -e "CREATE USER IF NOT EXISTS test@localhost IDENTIFIED BY 't3stp4ss';"
mysql -e "GRANT ALL PRIVILEGES ON testdb.* TO test@localhost IDENTIFIED BY 't3stp4ss';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO root@localhost;"
mysql -e "ALTER USER root@localhost IDENTIFIED BY '1234';"
mysql -u root -p1234 -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p1234 shutdown
exec /usr/sbin/mysqld --user=mysql --console

