#!/bin/sh
sleep 20
wp config create --allow-root \
	--dbname=testdb \
	--dbuser=test \
	--dbpass=t3stp4ss \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'
wp core install --title=inception\
	--admin_user=toto \
	--admin_password=toto \
	--admin_email=toto@42.fr \
	--path='/var/www/wordpress' \
	--allow-root


php-fpm7.4 -F
