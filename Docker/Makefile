.PHONY: build install start down install-no-symfony build-only 
# instal for the first time only symfony
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
    composer require symfony/validator

#install tout les package symfony sans recréer un symfony
install-no-symfony : 
	cd sfapi && \
	composer install --ignore-platform-req=ext-* --no-scripts && \
	composer require symfony/maker-bundle --dev && \
	composer require symfony/mailer && \
	composer require symfony/orm-pack && \
	composer require symfony/http-client && \
	composer require symfony/security-bundle && \
	composer require symfony/orm-pack && \
    composer require --dev symfony/maker-bundle && \
    composer require symfony/validator

# instal symfony and build docker
build: install start

build-only : install-no-symfony start

#Build docker 
start:
	docker compose up --build -d --wait

# Shut down docker
down:
	docker compose down