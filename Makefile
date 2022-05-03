MKDIR = mkdir -p
SRCS_DIR = ./srcs
DOCKER_COMPOSE_FILE = $(SRCS_DIR)/docker-compose.yml
ENV_FILE = $(SRCS_DIR)/.env
RM = rm
DATA_DIR = $(HOME)/data
DB_DIR = $(DATA_DIR)/mysql
WP_DIR = $(DATA_DIR)/html

build: $(DB_DIR) $(WP_DIR) host
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d

host:
	grep '127.0.0.1\s*rotrojan.42.fr' /etc/hosts || sudo sh -c 'echo "127.0.0.1\trotrojan.42.fr" >> /etc/hosts'

check:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --volume

$(DB_DIR):
	sudo $(MKDIR) $@

$(WP_DIR):
	sudo $(MKDIR) $@

clean:
	sudo $(RM) -rf $(DB_DIR) $(WP_DIR)
	sudo $(RM) -d $(DATA_DIR) || true

prune:
	docker system prune -a

re: clean down build

.PHONY: build check logs stop down clean prune re debug host
