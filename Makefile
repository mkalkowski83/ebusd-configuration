# Makefile for ebusd-configuration management

# Docker container names
NPM_CONTAINER = npm
DOCKER_COMPOSE = docker-compose

# Paths
TARGET_DIR = ebusd-2.1.x/en/vaillant
OUTPUT_DIR = outcsv/@ebusd/ebus-typespec/vaillant/

.PHONY: docker-up docker-exec compile copy-file all clean

# Start Docker containers
docker-up:
	@echo "Starting Docker containers with GitHub credentials..."
	$(DOCKER_COMPOSE) up -d -e GITHUB_USER=$(GITHUB_ACTOR) -e GITHUB_TOKEN=$(GITHUB_TOKEN)

# Execute shell in npm container
docker-exec:
	@echo "Opening shell in npm container with GitHub credentials..."
	$(DOCKER_COMPOSE) exec -it -e GITHUB_USER=$(GITHUB_ACTOR) -e GITHUB_TOKEN=$(GITHUB_TOKEN) $(NPM_CONTAINER) /bin/sh

# Compile TypeScript file and copy result to target directory
compile:
	@echo "Compiling TypeScript file..."
	$(DOCKER_COMPOSE) exec -e GITHUB_USER=$(GITHUB_ACTOR) -e GITHUB_TOKEN=$(GITHUB_TOKEN) $(NPM_CONTAINER) npm run compile

compile-pl:
	@echo "Compiling TypeScript file (Polish translation)..."
	$(DOCKER_COMPOSE) exec -e GITHUB_USER=$(GITHUB_ACTOR) -e GITHUB_TOKEN=$(GITHUB_TOKEN) $(NPM_CONTAINER) npm run compile-pl

clean-output:
	@echo "Cleaning up output files..."
	rm -f $(OUTPUT_FILE)

# Run all steps
all: docker-up compile
	@echo "All tasks completed"

compile-copy: compile
	@echo "All tasks completed"

# Clean up
clean:
	@echo "Cleaning up..."
	$(DOCKER_COMPOSE) down
	@echo "Docker containers stopped" 