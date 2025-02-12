# Utilise une image officielle Python
FROM python:3.9-slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier requirements.txt dans le conteneur
COPY ./requirements.txt ./

# Installe les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie le reste du code de l'API dans le conteneur
COPY . .

# Expose le port sur lequel l'API écoute (par exemple 5000)
EXPOSE 5000

# Définit la commande de démarrage de l'API
CMD ["python", "api.py"]