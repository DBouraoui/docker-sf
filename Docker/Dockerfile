#Alpine est l'image la plus légère de linux
FROM alpine:latest

#Instal les packets nécéssaire basique
RUN apk update && \
    apk upgrade && \
    apk add  php84 php84-fpm nginx

RUN adduser -S -G www-data www-data

# Création des répertoires nécessaires avec les logs
RUN mkdir -p /run/nginx && \
    mkdir -p /var/run/php && \
    mkdir -p /var/www/public && \
    mkdir -p /var/log/nginx && \
    mkdir -p /var/log/php-fpm && \
    touch /var/log/nginx/error.log && \
    touch /var/log/nginx/access.log && \
    chown -R www-data:www-data /var/www /var/www && \
    chown -R www-data:www-data /var/www /run/nginx && \
    chown -R www-data:www-data /var/www /var/run/php && \
    chown -R www-data:www-data /var/www /var/log/nginx && \
    chown -R www-data:www-data /var/www /var/log/php-fpm

#Copie du fichier nginx dans le container
COPY nginx.conf /etc/nginx/nginx.conf

#Copie du ficher php-fpm conf dans le container
COPY www.conf /etc/php84/php-fpm.d/www.conf

#Copie du fichier pour démarer le serveur
COPY start.sh /start.sh

#Ajout des droit pour le fichier
RUN chmod +x /start.sh

CMD ["./start.sh"]