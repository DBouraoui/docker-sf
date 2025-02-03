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
make go

# Ou étape par étape :
make build    # Construire l'image
make send     # Lancer le conteneur
```

## 📝 Commandes disponibles

### Makefile

```bash
make build    # Construit l'image Docker
make send     # Lance le conteneur
make go       # Construit l'image, crée un projet Symfony et lance le conteneur
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

### Ports

- Nginx : 80
- PHP-FPM : Socket Unix

### Volumes

Le projet Symfony est monté dans `/var/www` du conteneur.

## 💻 Développement

1. Les modifications dans `sfapi/` sont automatiquement synchronisées avec le conteneur
2. Pas besoin de reconstruire l'image pour les modifications de code
3. Les dépendances sont gérées dans le conteneur

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

## 🔧 Maintenance

### Mise à jour des dépendances

```bash
docker exec -it nom_conteneur composer update
```

### Nettoyage

```bash
docker system prune -a  # Nettoie les images non utilisées
```
