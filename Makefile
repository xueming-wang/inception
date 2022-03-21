# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xuwang <xuwang@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/21 15:15:41 by xuwang            #+#    #+#              #
#    Updated: 2022/03/17 16:18:30 by xuwang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all:
	sudo mkdir -p /home/xuwang/data/wordpress-v /home/xuwang/data/mariadb-v
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down
	
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
	
mysql:
	-docker exec -it mysql bash

wp:
	-docker exec -it wordpress bash

nginx:
	-docker exec -it nginx bash
			
clear: 
	-docker-compose -f ./srcs/docker-compose.yml down
	-docker rm -f $$(docker ps -a -q)
	-docker volume rm $$(docker volume ls -q)
	-docker rmi -f $$(docker images -aq)
	-docker network rm $$(docker network ls -q)

clean: clear

fclean: clean
	docker system prune -a --force

re: fclean all

.PHONY: all down clean mysql wp nginx clear

