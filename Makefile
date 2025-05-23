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
	$(DOCKER_COMPOSE) exec $(NPM_CONTAINER) npm run compile


compile-pl:
	@echo "Compiling TypeScript file..."
	$(DOCKER_COMPOSE) exec $(NPM_CONTAINER) npm run compile-pl


clean-output:
	@echo "Cleaning up output files..."
	rm -f $(OUTPUT_FILE)

# Run all steps
all: up compile clean-output
	@echo "All tasks completed"

restart-daemon:
	@echo "Running restarting ebusd darmon..."
	systemctl restart ebusd

compile-restart: compile restart-daemon

# Clean up
down:
	@echo "Cleaning up..."
	$(DOCKER_COMPOSE) down
	@echo "Docker containers stopped" 