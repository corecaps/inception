FROM debian:bullseye
RUN 	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server 
#mkdir -p /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld
#RUN chmod 777 /var/run/mysqld
#RUN mkdir -p /var/lib/mysql
#RUN chown -R mysql:mysql /var/lib/mysql
#RUN chmod 777 /var/lib/mysql
COPY conf/mysql.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
#RUN /usr/local/bin/mariadb.sh
