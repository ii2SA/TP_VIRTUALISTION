# Utilise une image de base légère pour servir des fichiers statiques
FROM nginx:alpine

# Copie le contenu du dossier (HTML, CSS, JS) dans le répertoire Nginx
COPY . /usr/share/nginx/html

# Expose le port 80 (celui utilisé par Nginx)
EXPOSE 80

# La commande de démarrage est déjà définie dans l'image Nginx, donc aucun CMD supplémentaire n'est nécessaire
