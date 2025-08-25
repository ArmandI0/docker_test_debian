CONTAINER_NAME=tskmaster-debian
IMAGE_NAME=tskmaster-debian
COMPOSE_FILE=docker-compose.yml

build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) run --rm app zsh

down:
	docker-compose -f $(COMPOSE_FILE) down

rm:
	@echo "Suppression des conteneurs Docker Compose..."
	docker-compose -f $(COMPOSE_FILE) down --rmi local -v --remove-orphans

clean:
	@echo "🧹 Suppression des conteneurs associés..."
	docker-compose -f $(COMPOSE_FILE) down --remove-orphans

	@echo "🧼 Suppression de l'image Docker..."
	@if docker image inspect $(IMAGE_NAME) > /dev/null 2>&1; then \
		docker rmi -f $(IMAGE_NAME); \
	else \
		echo "Aucune image à supprimer."; \
	fi

	@echo "🗑️ Suppression des fichiers temporaires..."
	-rm -rf __pycache__ *.pyc *.pyo *.log

	@echo "✅ Nettoyage terminé."

prune:
	@echo "🔥 Suppression des images anonymes (<none>)..."
	docker image prune -f

	@echo "🧽 Suppression des volumes non utilisés..."
	docker volume prune -f

	@echo "🧼 Suppression du cache Docker (dangling builds)..."
	docker builder prune -f

	@echo "✅ Docker nettoyé."

restart: down up