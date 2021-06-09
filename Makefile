NAME = inception
SRCS_DIR = ./srcs
DC_FILE = docker-compose.yml
DC = docker-compose -f $(SRCS_DIR)/$(DC_FILE) --env-file $(SRCS_DIR)/.env
REQ = ./requirements
DB_DIR = $(SRCS_DIR)/$(REQ)/$(DB)
WP_DIR = $(SRCS_DIR)/$(REQ)/$(WP)
WEBSERV_DIR = $(SRCS_DIR)/$(REQ)/$(WEBSERV_DIR)

all: $(NAME)

$(NAME): build dirs
	$(DC) up -d

build:
	sed -i '/DEBUG=/d' $(SRCS_DIR)/.env
	$(DC) build

debug: dirs
	sed -i '/DEBUG=/d' $(SRCS_DIR)/.env
	echo DEBUG=1 >> $(SRCS_DIR)/.env
	$(DC) build
	$(DC) up -d

dirs:
	sudo mkdir -p /data/mysql && sudo chown -R mysql:mysql /data/mysql
	sudo mkdir -p /data/html && sudo chown -R www-data:www-data /data/html

mariadb:
	docker attach srcs_mysql_1

wordpress:
	docker attach srcs_wordpress_1

nginx:
	docker attach srcs_nginx_1

clean:
	$(DC) down

re: clean $(NAME)

fclean:
	docker-compose system prune 

.PHONY: all $(NAME) build debug dirs mariadb wordpress nginx clean re
