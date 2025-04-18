# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cpoulain <cpoulain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/18 15:03:20 by cpoulain          #+#    #+#              #
#    Updated: 2025/04/18 15:03:43 by cpoulain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=	inception
COMPOSE		:=	./srcs/docker-compose.yml
DATA_DIR	:=	./data

all: $(NAME)

$(NAME):
	@mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mysql
	@docker-compose -f $(COMPOSE) build --parallel
	@docker-compose -f $(COMPOSE) up -d --build

down:
	@docker-compose -f $(COMPOSE) down

clean:
	@docker-compose -f $(COMPOSE) down -v

fclean: clean
	@docker system prune --force --volumes --all
	@sudo rm -rf $(DATA_DIR)

re: down all

logs:
	@echo "---------- MARIADB -----------\n"
	@docker-compose -f $(COMPOSE) logs mariadb
	@echo "\n-------- WORDPRESS ----------\n"
	@docker-compose -f $(COMPOSE) logs wordpress
	@echo "\n---------- NGINX ------------\n"
	@docker-compose -f $(COMPOSE) logs nginx
