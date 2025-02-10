#Alpine est l'image la plus légère de linux
FROM alpine:latest

#Installation des packets nécessaires basiques
RUN apk update && \
    apk upgrade && \
    apk add \
    php84 \
    php84-fpm \
    nginx \
    composer

RUN apk add php84-session \
    php84-tokenizer \
    php84-ctype \
    php84-iconv \
    php84-json \
    php84-mbstring \
    php84-openssl \
    php84-xml \
    php84-xmlwriter \
    php84-simplexml \
    php84-pdo \
    php84-pdo_mysql \
    php84-opcache \
    php84-intl \
    php84-apcu \
    php84-zip \
    php84-curl \
    php84-phar \
    php84-dom \
    php84-xmlreader \
    php84-mysqli \
    php84-gd \
    git \
    unzip


# Configuration de l'utilisateur
RUN adduser -S -G www-data www-data

# Création des répertoires et configuration des permissions
RUN mkdir -p /run/nginx /var/run/php /var/www/public /var/log/nginx /var/log/php-fpm && \
    touch /var/log/nginx/error.log /var/log/nginx/access.log && \
    chown -R www-data:www-data /var/www && \
    chown -R www-data:www-data /run/nginx && \
    chown -R www-data:www-data /var/run/php && \
    chown -R www-data:www-data /var/log/nginx && \
    chown -R www-data:www-data /var/log/php-fpm

# Configuration des fichiers
COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php84/php-fpm.d/www.conf
COPY php.ini /etc/php84/php.ini

COPY ./sfapi /var/www

WORKDIR /var/www

RUN composer install --ignore-platform-req=ext-* --no-scripts

# Script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]