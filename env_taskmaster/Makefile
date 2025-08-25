COMPOSE = docker compose
SERVICE = taskmaster-dev
VOLUME = taskmaster_dev_data  # Remplace par le nom réel du volume si besoin

default: up

## Démarre l'environnement (attache au terminal)
up:
	$(COMPOSE) up -d

## Build et démarre l'environnement
build:
	$(COMPOSE) up --build

## Détache en arrière-plan
start:
	$(COMPOSE) up -d
	@echo "\nApp started in background"

## Stoppe les conteneurs
stop:
	$(COMPOSE) stop

## Nettoyage complet : containers, images, volumes non utilisés
clean: stop
	docker system prune -af
	docker volume prune -f

## Redémarre tout proprement
re: clean build

## Redémarre un service spécifique et supprime son volume
restart-service:
	@if [ -z "$(SERVICE)" ] || [ -z "$(VOLUME)" ]; then \
		echo "Usage: make restart-service SERVICE=nom_du_service VOLUME=nom_du_volume"; \
		echo "Example: make restart-service SERVICE=taskmaster-dev VOLUME=taskmaster_dev_data"; \
		exit 1; \
	fi
	$(COMPOSE) stop $(SERVICE)
	$(COMPOSE) rm -f $(SERVICE)
	docker volume rm $(VOLUME) || true
	$(COMPOSE) up -d $(SERVICE)

## Affiche l’état de Docker (conteneurs, images, volumes, réseaux)
status:
	docker ps
	@echo "\n--- Images ---"
	docker images
	@echo "\n--- Volumes ---"
	docker volume ls
	@echo "\n--- Networks ---"
	docker network ls

shell:
	docker exec -it debian-taskmaster-dev-1 zsh

.PHONY: default up build start stop clean re restart-service status
