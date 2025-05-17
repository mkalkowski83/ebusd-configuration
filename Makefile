# Makefile for ebusd-configuration management

# Docker container names
NPM_CONTAINER = npm
DOCKER_COMPOSE = docker compose

# Paths
TARGET_DIR = ebusd-2.1.x/en/vaillant
OUTPUT_DIR = outcsv/@ebusd/ebus-typespec/vaillant/

.PHONY: up sh compile clean-output all down

# Start Docker containers
up:
	@echo "Starting Docker containers"
	$(DOCKER_COMPOSE) up

# Execute shell in npm container
sh:
	@echo "Opening shell in npm container"
	$(DOCKER_COMPOSE) exec -it $(NPM_CONTAINER) /bin/sh

# Compile TypeScript file and copy result to target directory
compile:
	@echo "Compiling TypeScript file..."
	$(DOCKER_COMPOSE) exec $(NPM_CONTAINER) npm run compile


clean-output:
	@echo "Cleaning up output files..."
	rm -f $(OUTPUT_FILE)

# Run all steps
all: docker-up compile clean-output
	@echo "All tasks completed"

# Clean up
down:
	@echo "Cleaning up..."
	$(DOCKER_COMPOSE) down
	@echo "Docker containers stopped" 