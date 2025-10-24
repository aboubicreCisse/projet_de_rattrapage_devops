# Utiliser une image Python officielle
FROM python:3.12-slim

# Variables d'environnement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Créer et utiliser le répertoire /app
WORKDIR /app

# Copier requirements.txt 
COPY requirements.txt /app/

# Installer les dépendances
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copier le code de l'application
COPY . /app/

# Exposer le port 8000
EXPOSE 8000

# Commande pour lancer Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
