#!/bin/sh

# Fonction pour vérifier si un service est prêt
wait_for_service() {
    service=$1
    process=$2
    max_attempts=10
    attempt=1

    while [ $attempt -le $max_attempts ]; do
        if pgrep "$process" > /dev/null; then
            echo "$service is ready"
            return 0
        fi
        echo "Waiting for $service (attempt $attempt/$max_attempts)..."
        sleep 1
        attempt=$((attempt + 1))
    done

    echo "$service failed to start"
    return 1
}

# Démarrage de PHP-FPM
echo "Starting PHP-FPM..."
php-fpm84 -F &
wait_for_service "PHP-FPM" "php-fpm84" || exit 1

# Démarrage de Nginx
echo "Starting Nginx..."
nginx
wait_for_service "Nginx" "nginx" || exit 1

echo "All services are running"

# Garder le conteneur en vie et capturer les signaux
trap 'echo "Stopping services..."; kill -TERM 1; wait' TERM INT

# Attendre tous les processus
wait