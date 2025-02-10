.PHONY: build install start down

# instal for the first time only symfony and all packages
install:
	mkdir -p sfapi && \
	cd sfapi && \
	composer create-project symfony/skeleton:"7.2.x" . && \
	composer require symfony/maker-bundle --dev && \
	composer require symfony/mailer && \
	composer require symfony/orm-pack && \
	composer require symfony/http-client && \
	composer require symfony/security-bundle && \
	composer require symfony/orm-pack && \
	composer require --dev symfony/maker-bundle && \
	composer require lexik/jwt-authentication-bundle && \
	php bin/console lexik:jwt:generate-keypair

# instal symfony and build docker
build: install start

#Build docker 
start:
	docker compose up --build -d --wait

# Shut down docker
down:
	docker compose down
