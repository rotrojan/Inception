MKDIR = mkdir -p
SRCS_DIR = ./srcs
DOCKER_COMPOSE_FILE = $(SRCS_DIR)/docker-compose.yml
ENV_FILE = $(SRCS_DIR)/.env

build: /data/mysql /data/html
	docker-compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) up

check:
	docker-compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) ps

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) logs

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) stop

/data/mysql:
	sudo $(MKDIR) /data/mysql && sudo chown -R mysql:mysql /data/mysql

/data/html:
	sudo $(MKDIR) /data/html && sudo chown -R www-data:www-data /data/html

.PHONY: build dirs check logs
