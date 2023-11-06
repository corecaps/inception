#!/bin/sh
/etc/init.d/mariadb start
mysql_secure_installation << EOF
Y
Y


Y
Y
Y
Y
EOF

mysql -e "CREATE DATABASE IF NOT EXISTS testdb;"
exec /usr/sbin/mysqld --user=mysql --console
