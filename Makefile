# Convenience commands for local development
# These targets document common workflows

.PHONY: up down ps

up:
	docker compose up -d

down:
	docker compose down

ps:
	docker ps
