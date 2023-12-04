#!/bin/sh
#
#                      
#                      o._  _ _ .__|_o _ ._  
#                      || |(_(/_|_)|_|(_)| | 
#                               |            
                               
sleep 20
if [ ! -f /var/www/wordpress/wp-config.php ]; then \
wp-cli.phar config create --allow-root \
	--dbname=testdb \
	--dbuser=test \
	--dbpass=t3stp4ss \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'; \
wp-cli.phar core install --title=inception\
	--admin_user=toto \
	--admin_password=toto \
	--admin_email=toto@42.fr \
	--path='/var/www/wordpress' \
	--url='https://jgarcia.42.fr' \
	--allow-root ; \
wp-cli.phar user create \
	tata \
	tata@42.fr \
	--user_pass=tata \
	--path=/var/www/wordpress \
	--allow-root ; \
fi

php-fpm7.4 -F
