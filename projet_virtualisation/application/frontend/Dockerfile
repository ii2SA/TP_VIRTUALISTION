FROM nginx:alpine

# Supprimer les fichiers par défaut
RUN rm -rf /usr/share/nginx/html/*

# Copie la configuration Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copie le contenu du dossier (HTML, CSS, JS) dans le répertoire Nginx
COPY . /usr/share/nginx/html

# Expose le port 80 (celui utilisé par Nginx)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
