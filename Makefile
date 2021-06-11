NAME = inception
SRCS_DIR = ./srcs
DC_FILE = docker-compose.yml
DC = docker-compose -f $(SRCS_DIR)/$(DC_FILE) --env-file $(SRCS_DIR)/.env
REQ = ./requirements
DB_DIR = $(SRCS_DIR)/$(REQ)/$(DB)
WP_DIR = $(SRCS_DIR)/$(REQ)/$(WP)
WEBSERV_DIR = $(SRCS_DIR)/$(REQ)/$(WEBSERV_DIR)
VOLUMES_DIR = /home/rotrojan/data

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
	sudo mkdir -p $(VOLUMES_DIR)/database && sudo chown -R mysql:mysql $(VOLUMES_DIR)/database
	sudo mkdir -p $(VOLUMES_DIR)/wordpress && sudo chown -R www-data:www-data $(VOLUMES_DIR)/wordpress

mariadb: debug
	docker attach srcs_mariadb_1

wordpress: debug
	docker attach srcs_wordpress_1

nginx: debug
	docker attach srcs_nginx_1

check:
	docker ps
	$(DC) ps

clean:
	$(DC) down

fclean: clean
	sudo rm -rf $(VOLUMES_DIR)/database $(VOLUMES_DIR)/wordpress
#	docker-compose system prune 

re: fclean $(NAME)

.PHONY: all $(NAME) build debug dirs mariadb wordpress nginx clean re
