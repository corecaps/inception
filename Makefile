all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb 
	sudo hostsed add 127.0.0.1 jgarcia.42.fr
	docker-compose build -f ./srcs/docker-compose.yml
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo hostsed rm 127.0.0.1 jgarcia.42.fr
	if [ -d "/home/jgarcia/data/wordpress" ]; then \
	sudo rm -rf /home/jgarcia/data/wordpress ; \
	fi
	if [ -d "/home/jgarcia/data/mariadb" ]; then \
	sudo rm -rf /home/jgarcia/data/mariadb ; \
	fi

re: fclean all

ls:
	docker image ls
	docker ps

.PHONY:all, clean, fclean, re, ls
