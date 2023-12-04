#!/bin/sh
#
#                      
#                      o._  _ _ .__|_o _ ._  
#                      || |(_(/_|_)|_|(_)| | 
#                               |            
#
/etc/init.d/mariadb start
mysql_secure_installation << __EOF
Y
Y


Y
Y
Y
Y
__EOF
mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '{$DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO root@localhost;"
mysql -e "ALTER USER root@localhost IDENTIFIED BY '${DATABASE_ROOT_PASS};"
mysql -u root -p${DATABASE_ROOT_PASS} -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${DATABASE_ROOT_PASS} shutdown
exec /usr/sbin/mysqld --user=mysql --console

