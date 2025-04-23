# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cpoulain <cpoulain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/18 15:03:20 by cpoulain          #+#    #+#              #
#    Updated: 2025/04/22 07:45:37 by cpoulain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=	inception
COMPOSE		:=	./srcs/docker-compose.yml
DATA_DIR	:=	/home/cpoulain/data
ENV_FILE	:=	--env-file /home/cpoulain/.env_inception

all: $(NAME)

$(NAME):
	@mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mysql
	@docker-compose $(ENV_FILE) -f $(COMPOSE) up -d --build

down:
	@docker-compose $(ENV_FILE) -f $(COMPOSE) down

clean:
	@docker-compose $(ENV_FILE) -f $(COMPOSE) down -v

fclean: clean
	@docker system prune --force --volumes --all
	@sudo rm -rf $(DATA_DIR)

re: down all

logs:
	@echo "---------- MARIADB -----------\n"
	@docker-compose $(ENV_FILE) -f $(COMPOSE) logs mariadb
	@echo "\n-------- WORDPRESS ----------\n"
	@docker-compose $(ENV_FILE) -f $(COMPOSE) logs wordpress
	@echo "\n---------- NGINX ------------\n"
	@docker-compose $(ENV_FILE) -f $(COMPOSE) logs nginx

.PHONY: all down clean fclean re logs
