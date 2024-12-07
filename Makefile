
.PHONY: build

build:
	docker build -t ghcr.io/croox/docker-pa11y-dashboard:4.2.0 ./4.2.0
	docker tag ghcr.io/croox/docker-pa11y-dashboard:4.2.0 ghcr.io/croox/docker-pa11y-dashboard:latest

push:
	docker push ghcr.io/croox/docker-pa11y-dashboard:4.2.0
	docker push ghcr.io/croox/docker-pa11y-dashboard:latest
