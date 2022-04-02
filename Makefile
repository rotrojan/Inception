MKDIR = mkdir -p
SRCS_DIR = ./srcs
DOCKER_COMPOSE_FILE = $(SRCS_DIR)/docker-compose.yml
ENV_FILE = $(SRCS_DIR)/.env
RM = rm
DATA_DIR = $(HOME)/data
DB_DIR = $(DATA_DIR)/mysql
WP_DIR = $(DATA_DIR)/html

build: $(DB_DIR) $(WP_DIR)
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d

check:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --volume

$(DB_DIR):
	sudo $(MKDIR) $@ && sudo chown -R mysql:mysql $@

$(WP_DIR):
	sudo $(MKDIR) $@ && sudo chown -R www-data:www-data $@

debug:
	# Declare the DEBUG variable and set it to 1 in order to easily debug the containers (see the run.sh for each container);
	sed -i '/DEBUG-/d' $(ENV_FILE)
	echo DEBUG=1 >> $(ENV_FILE)
	$(MAKE) build

mariadb: debug
	docker attach srcs_mariadb_1

nginx: debug
	docker attach srcs_nginx_1

wordpress: debug
	docker attach srcs_wordpress_1

clean:
	sudo $(RM) -rf $(DB_DIR) $(WP_DIR)
	sudo $(RM) -d $(DATA_DIR) || true

prune:
	docker system prune -a

re: clean down build

.PHONY: build check logs stop clean prune re debug
