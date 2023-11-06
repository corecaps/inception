all:
	docker build -t nginx ./srcs/requirements/nginx
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -d -p 443:443 nginx
	docker run -d -p 3306:3306 mariadb

.PHONY:all
