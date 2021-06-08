NAME = inception
SRCS_DIR = ./srcs
DB = mariadb
WP = wordpress
WERSERV = nginx
DC_FILE = docker-compose.yml
DC = docker-compose -f $(SRCS_DIR)/$(DC_FILE) --env-file $(SRCS_DIR)/.env
REQ = ./requirements
DB_DIR = $(SRCS_DIR)/$(REQ)/$(DB)
WP_DIR = $(SRCS_DIR)/$(REQ)/$(WP)
WEBSERV_DIR = $(SRCS_DIR)/$(REQ)/$(WEBSERV_DIR)
DOCKERFILES = $(WP) 

vpath Dockerfile $(addprefix $(SRCS_DIR)/$(REQ), $(DB), $(WP))

all: $(NAME)

$(NAME): build
	sudo mkdir -p /data/mysql && sudo chown -R mysql:mysql /data/mysql
	sudo mkdir -p /data/html && sudo chown -R www-data:www-data /data/html
	$(DC) up -d

build:
	$(DC) build

# db:
	# docker build . -f=$(DB_DIR)/Dockerfile -t mariadb
# wp:
	# docker build . -f=$(DB_DIR)/Dockerfile -t wordpress
