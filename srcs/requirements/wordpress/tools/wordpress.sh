#!/bin/sh
#
#                      
#                      o._  _ _ .__|_o _ ._  
#                      || |(_(/_|_)|_|(_)| | 
#                               |            
                               
sleep 20
if [ ! -f /var/www/wordpress/wp-config.php ]; then \
wp-cli.phar config create --allow-root \
	--dbname=$DATABASE_NAME \
	--dbuser=$DATABASE_USER \
	--dbpass=$DATABASE_PASS \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'; \
wp-cli.phar core install --title=inception\
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASS \
	--admin_email=$WP_ADMIN_MAIL \
	--path='/var/www/wordpress' \
	--url='https://jgarcia.42.fr' \
	--allow-root ; \
wp-cli.phar user create \
	$WP_USER_NAME \
	$WP_USER_MAIL \
	--user_pass=$WP_USER_PASS \
	--path=/var/www/wordpress \
	--allow-root ; \
fi

php-fpm7.4 -F
