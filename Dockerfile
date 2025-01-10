# Ce Dockerfile configure un environnement de conteneur pour travailler avec MkDocs.
# Il permet de construire, développer localement, et servir la documentation générée par MkDocs.
# Le fichier est organisé en plusieurs étapes, permettant différentes tâches :
# - Initialisation d'un projet MkDocs,
# - Développement local avec un serveur MkDocs,
# - Construction des fichiers statiques de la documentation,
# - Déploiement du site généré sur un serveur HTTP (Apache).

# Utilise l'image officielle Python basée sur Alpine (version légère d'Alpine Linux) pour l'exécution
FROM python:alpine AS base

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier requirements.txt (liste des dépendances) dans le répertoire de travail
COPY requirements.txt .

# Installe Git dans le conteneur, nécessaire pour récupérer des dépôts ou gérer les versions
RUN apk add --no-cache git

# Installe les dépendances Python spécifiées dans requirements.txt
RUN pip install -r requirements.txt


# Créer un nouveau projet MkDocs
FROM base as init

# Par défaut, exécute la commande mkdocs new pour initialiser un nouveau projet MkDocs
CMD ["mkdocs", "new", "example"]

# Stage to dev locally, pas de copy car on bind mount
# Cette étape est dédiée au développement local
# On n'a pas besoin de copier les fichiers, car ils seront montés en bind-mount
FROM base as dev

# Installe Neovim pour pouvoir éditer les fichiers directement dans le conteneur (optionnel)
RUN apk add --no-cache neovim

# Démarre le serveur MkDocs sur toutes les interfaces réseau, à l'adresse 0.0.0.0 sur le port 8000
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

# Cette étape est dédiée à la génération des fichiers statiques de la documentation
FROM base as build

# Copie tout le contenu du répertoire local dans le répertoire de travail du conteneur
COPY . .

# La commande suivante a été commentée, mais elle pourrait être utilisée pour configurer Git et construire la documentation
#RUN git config --global --add safe.directory . && mkdocs build

# Démarre la construction des fichiers statiques MkDocs (le site)
CMD ["mkdocs", "build"]

# Et on place ca dans le container final
# Cette partie est responsable de la mise en place du site dans un serveur web
# Utilisation de l'image officielle Nginx (commentée ici) ou de l'image Apache (en actif)

# Avec Nginx, on copie les fichiers générés dans le répertoire attendu par Nginx pour servir le site
FROM nginx:alpine
COPY --from=build /app/site /usr/share/nginx/html

# Utilisation de l'image Apache HTTP Server (version 2.4) pour servir le site
# FROM httpd:2.4

# Copie les fichiers générés par MkDocs dans le répertoire web d'Apache
COPY --from=build /app/site /usr/local/apache2/htdocs/

# Copie le fichier de configuration HTTPD personnalisé dans le conteneur
COPY httpd.conf /usr/local/apache2/conf/

