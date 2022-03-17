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

NAME=inception

all = $(NAME)

start:
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
	-docker network rm $(docker network ls -q) 2>/dev/null

clean: clear

fclean: clear
	docker system prune -a --force

re: fclean all

.PHONY: start down clean mysql wp nginx clear

