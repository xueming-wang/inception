# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xuwang <xuwang@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/21 15:15:41 by xuwang            #+#    #+#              #
#    Updated: 2022/03/24 19:23:46 by xuwang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include ./srcs/.env

all:
	sudo mkdir -p /home/xuwang/data/wordpress-v /home/xuwang/data/mariadb-v
	sudo echo "127.0.0.1 " $(DOMAIN_NAME) >> /etc/hosts
	docker-compose -f ./srcs/docker-compose.yml up -d --build
	
start:
	docker-compose -f ./srcs/docker-compose.yml start

down:
	docker-compose -f ./srcs/docker-compose.yml down
	
clean: 
	rm -rf /home/xuwang/data
	-docker stop $$(docker ps -aq)
	-docker rm -f $$(docker ps -aq)
	-docker volume rm $$(docker volume ls -q)
	-docker rmi -f $$(docker images -aq)
	-docker network rm $$(docker network ls -q) 2>/dev/null


fclean: clean
	docker system prune -a --force

re: fclean all

.PHONY: all down clean fclean re start

