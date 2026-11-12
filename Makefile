# Makefile for ebusd-configuration management

# Docker container names
NPM_CONTAINER = npm
DOCKER_COMPOSE = docker compose

# Paths
TARGET_DIR = ebusd-2.1.x/en/vaillant
OUTPUT_DIR = outcsv/@ebusd/ebus-typespec/vaillant/

.PHONY: up bash compile clean-output all down

# Start Docker containers
up:
	@echo "Starting Docker containers"
	$(DOCKER_COMPOSE) up -d

# Execute shell in npm container
bash:
	@echo "Opening shell in npm container"
	$(DOCKER_COMPOSE) exec -it $(NPM_CONTAINER) /bin/bash

# Compile TypeScript file and copy result to target directory
compile:
	@echo "Compiling TypeScript file..."
	@if $(DOCKER_COMPOSE) ps --status running -q $(NPM_CONTAINER) 2>/dev/null | grep -q .; then \
		$(DOCKER_COMPOSE) exec -T $(NPM_CONTAINER) npm run compile; \
	else \
		$(DOCKER_COMPOSE) run --rm --no-deps $(NPM_CONTAINER) npm run compile; \
	fi


compile-pl:
	@echo "Compiling TypeScript file..."
	@if $(DOCKER_COMPOSE) ps --status running -q $(NPM_CONTAINER) 2>/dev/null | grep -q .; then \
		$(DOCKER_COMPOSE) exec -T $(NPM_CONTAINER) npm run compile-pl; \
	else \
		$(DOCKER_COMPOSE) run --rm --no-deps $(NPM_CONTAINER) npm run compile-pl; \
	fi

# Run all steps
all: up compile clean-output
	@echo "All tasks completed"

restart-daemon:
	@echo "Running restarting ebusd daemon..."
	systemctl restart ebusd

compile-restart: compile restart-daemon

# Clean up
down:
	@echo "Cleaning up..."
	$(DOCKER_COMPOSE) down
	@echo "Docker containers stopped" 