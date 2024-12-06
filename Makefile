
.PHONY: build

build:
	docker build --platform linux/amd64 -t ghcr.io/croox/docker-pa11y-dashboard:4.2.0 ./4.2.0
	docker tag ghcr.io/croox/docker-pa11y-dashboard:4.2.0 ghcr.io/croox/docker-pa11y-dashboard:latest
	ln -sf ./4.2.0 ./latest

push:
	docker push ghcr.io/croox/docker-pa11y-dashboard:4.2.0
	docker push ghcr.io/croox/docker-pa11y-dashboard:latest
