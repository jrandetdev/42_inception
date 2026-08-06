NAME			= inception

SRCS_DIR		= srcs
COMPOSE_FILE	= $(SRCS_DIR)/docker-compose.yml
ENV_FILE		= $(SRCS_DIR)/.env

include $(ENV_FILE)

DOMAIN			= $(DOMAIN_NAME)

COMPOSE			= docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE)

SECRETS_DIR		= secrets
SECRETS			= $(SECRETS_DIR)/mariadb_root_password.txt \
				  $(SECRETS_DIR)/mariadb_password.txt \
				  $(SECRETS_DIR)/wp_admin_password.txt \
				  $(SECRETS_DIR)/wp_user_password.txt

all: up

up: hosts secrets data
	$(COMPOSE) up -d --build

build:
	$(COMPOSE) build

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

start:
	$(COMPOSE) start

restart: down up

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

data:
	sudo mkdir -p $(DATA_PATH)/mariadb $(DATA_PATH)/wordpress
	sudo chown -R $$(id -u):$$(id -g) $(DATA_PATH)

secrets: $(SECRETS)

$(SECRETS_DIR)/%.txt:
	mkdir -p $(SECRETS_DIR)
	openssl rand -base64 24 > $@

hosts:
	@if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		echo "127.0.0.1 $(DOMAIN)" | sudo tee -a /etc/hosts > /dev/null; \
		echo "Added $(DOMAIN) to /etc/hosts"; \
	fi

clean: down
	$(COMPOSE) down --rmi all --volumes --remove-orphans

fclean: clean
	sudo rm -rf $(DATA_PATH)

re: fclean all

.PHONY: all up build down stop start restart logs ps data secrets clean fclean re
