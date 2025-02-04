.PHONY: build install start down

# instal for the first time only symfony
install:
	mkdir -p sfapi && \
	cd sfapi && \
	composer create-project symfony/skeleton:"7.2.x" . && \
	composer require symfony/maker-bundle --dev && \
	composer require symfony/mailer && \
	composer require symfony/orm-pack && \
	composer require symfony/http-client && \
	composer require symfony/security-bundle

# instal symfony and build docker
build: install start

#Build docker 
start:
	docker compose up --build -d

# Shut down docker
down:
	docker compose down