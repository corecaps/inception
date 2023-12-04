#                       
#	o._  _ _ .__|_o _ ._  
#	|| |(_(/_|_)|_|(_)| | 
#	         |            
#

FROM debian:bullseye
RUN 	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server 
COPY conf/mysql.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
CMD /usr/local/bin/mariadb.sh
