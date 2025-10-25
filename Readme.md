# Projet DevOps : Déploiement Automatisé d'une Application Django

## Description
Ce projet montre comment déployer automatiquement une application Django avec Docker et Jenkins.  
Il inclut le code source, la création d'une image Docker et le déploiement via Jenkins.

## Prérequis
- Docker installé
- Jenkins installé dans un conteneur Docker
- Git installé
- Navigateur pour accéder à Jenkins

## Installation et déploiement

1. Cloner le dépôt :
```bash
git clone https://github.com/aboubicreCisse/projet_de_rattrapage_devops.git
cd projet_de_rattrapage_devops

2. Construire l'image Docker :

docker build -t auto-deploy-app .


3. Lancer l'application :

docker run -d -p 8000:8000 --name mon-app auto-deploy-app


Ouvrir l'application dans le navigateur :

http://localhost:8000

Jenkins CI/CD

Pipeline pour construire l'image Docker et déployer automatiquement.

Logs et suivi directement dans Jenkins.

Image Docker sur Docker Hub

Nom : aboubicre7/auto-deploy-app:latest

Lien : https://hub.docker.com/r/aboubicre7/auto-deploy-app
