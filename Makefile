
.PHONY: build

build:
	docker build -t croox/pa11y-dashboard:4.2.0 ./4.2.0
	docker tag croox/pa11y-dashboard:4.2.0 croox/pa11y-dashboard:latest

push:
	docker push croox/pa11y-dashboard:4.2.0
	docker push croox/pa11y-dashboard:latest
