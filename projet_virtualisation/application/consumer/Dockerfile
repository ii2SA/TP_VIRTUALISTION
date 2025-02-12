# Utilise une image officielle Python
FROM python:3.9-slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier requirements.txt dans le conteneur (il peut être identique à celui du backend)
COPY ./requirements.txt ./

# Installe les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie le code du consumer dans le conteneur
COPY . .

# Le consumer n'a pas forcément besoin d'exposer de port, il s'exécute en arrière-plan
CMD ["python", "consumer.py"]