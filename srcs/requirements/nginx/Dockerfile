FROM debian:bullseye
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install curl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get -y install openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certif.crt -keyout /etc/nginx/ssl/certif.key -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=42/CN=jgarcia.42.fr/UID=jgarcia"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;"]
