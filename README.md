# Docker Symfony Alpine

Ce projet fournit une configuration Docker optimisée pour Symfony, basée sur Alpine Linux.

## 🏗 Structure

```
.
├── Docker/                 # Configuration Docker
│   ├── Dockerfile         # Configuration du conteneur
│   ├── nginx.conf         # Configuration Nginx
│   ├── www.conf          # Configuration PHP-FPM
│   └── start.sh          # Script de démarrage
├── sfapi/                 # Votre application Symfony
└── Makefile              # Commandes automatisées
```

## 🚀 Démarrage rapide

```bash
# Construire et lancer le projet
make build

# Ou étape par étape :
make install    # install symfony
make start     # send dockerfile
```

## 📝 Commandes disponibles

### Makefile

```bash
make build       # Create symfony and send dockerfile
make install     # Create symfony
make start       # Send container
make down        # Stop container
```

### Docker

```bash
# Entrer dans le conteneur
docker exec -it nom_conteneur bash

# Installer des dépendances Composer
docker exec -it nom_conteneur composer require [package]

# Exécuter des commandes Symfony
docker exec -it nom_conteneur php bin/console [commande]
```

## 🛠 Configuration

### Ports exposés

- **Nginx** : 80
- **PHP-FPM** : Socket Unix
- **MySQL** : 3306
- **phpMyAdmin** : 8080

### Volumes

- **Symfony** : `/var/www`
- **MySQL data** : `/var/lib/mysql`
- **PHP configuration** : `/etc/php84/php.ini`

### Services

#### 🖥️ Backend (Nginx + PHP-FPM)

- Base image : Alpine Linux
- PHP version : 8.4
- Configuration personnalisée dans `/etc/php84/php.ini`

#### 📊 MySQL

- Version : 8.0
- Platform : linux/amd64 (Compatible M1)
- Variables d'environnement configurables :
  ```env
  MYSQL_ROOT_PASSWORD=rootpassword
  MYSQL_DATABASE=dbname
  MYSQL_USER=user
  MYSQL_PASSWORD=password
  ```

#### 🗄️ phpMyAdmin

- Image ARM64 compatible (Mac M1)
- Accès : http://localhost:8080
- Connexion automatique à MySQL

## 💻 Développement

1. Les modifications dans `sfapi/` sont automatiquement synchronisées
2. Pas besoin de reconstruire l'image pour les modifications de code
3. Les dépendances sont gérées dans le conteneur
4. Interface phpMyAdmin pour la gestion de base de données

## ⚙️ Extensions PHP installées

- php84-session
- php84-tokenizer
- php84-ctype
- php84-iconv
- php84-json
- php84-mbstring
- php84-openssl
- php84-xml
- php84-xmlwriter
- php84-simplexml
- php84-pdo
- php84-pdo_mysql
- php84-opcache
- php84-intl
- php84-apcu
- php84-zip
- php84-curl
- php84-phar
- php84-dom
- php84-xmlreader

## 📝 Configuration PHP

Configuration optimisée dans `php.ini` :

- Memory limit : 256M
- Upload max : 20M
- OpCache activé
- Timezone : Europe/Paris
- Extensions préconfigurées

## 🔧 Commandes utiles

### Symfony et Composer

```bash
# Mettre à jour les dépendances
docker exec -it [container_name] composer update

# Créer une entité
docker exec -it [container_name] php bin/console make:entity

# Migrations
docker exec -it [container_name] php bin/console make:migration
docker exec -it [container_name] php bin/console doctrine:migrations:migrate
```

### Base de données

```bash
# Accès MySQL
docker exec -it [container_mysql] mysql -u root -p

# Backup
docker exec [container_mysql] mysqldump -u root -p database > backup.sql

# Restore
cat backup.sql | docker exec -i [container_mysql] mysql -u root -p database
```

### Logs

```bash
# Logs PHP
docker exec [container_name] tail -f /var/log/php/error.log

# Logs MySQL
docker exec [container_mysql] tail -f /var/log/mysql/error.log

# Logs Docker
docker compose logs -f
```

### Nettoyage

```bash
# Nettoyer les conteneurs non utilisés
docker compose down

# Nettoyer tout le système
docker system prune -a
```
