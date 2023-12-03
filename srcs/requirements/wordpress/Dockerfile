FROM debian:bullseye
RUN	apt-get -y update &&\
	apt-get -y upgrade &&\
	apt-get -y install wget &&\
	apt-get -y install php7.3 php-fpm php-mysql mariadb-client
RUN	wget https://wordpress.org/wordpress-6.4.1.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.4.1.tar.gz && rm wordpress-6.4.1.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp
RUN	php /usr/local/bin/wp --info
RUN	mkdir -p /run/php
COPY	tools/wordpress.sh /usr/local/bin
RUN	chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT /usr/local/bin/wordpress.sh
