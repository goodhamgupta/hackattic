.PHONY: help

help:
	@echo "Available commands: clean"
start-ngrok:
	ngrok http 5001
clean:
	docker-compose stop
	rm -rf data/docker/registry/v2/repositories
	docker-compose up -d
restart:
	docker-compose restart