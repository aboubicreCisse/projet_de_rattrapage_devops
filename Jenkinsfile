pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'aboubicrecisse/projet_de_rattrapage_devops'
        DOCKER_TAG = "latest"
    }
    
    stages {
        stage('Checkout Git') {
            steps {
                echo ' Récupération du code depuis GitHub...'
                checkout scm
            }
        }
        
        stage('Validate Project') {
            steps {
                echo ' Vérification des fichiers...'
                sh 'ls -la'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo ' Construction de l image Docker...'
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }
        
        stage('Deploy Application') {
            steps {
                echo ' DÉPLOIEMENT AUTOMATIQUE...'
                sh '''
                    # Arrêter l ancien conteneur
                    docker stop django-prod-app || true
                    docker rm django-prod-app || true
                    
                    # Démarrer le nouveau conteneur
                    docker run -d -p 8000:8000 --name django-prod-app ${DOCKER_IMAGE}:${DOCKER_TAG}
                    
                    echo " Application déployée avec succès"
                '''
            }
        }
        
        stage('Health Check') {
            steps {
                echo ' Vérification du déploiement...'
                sh '''
                    sleep 5
                    echo " Statut du conteneur :"
                    docker ps | grep django-prod-app
                    echo " Application disponible sur : http://localhost:8000"
                '''
            }
        }
    }
    
    post {
        success {
            echo ' PIPELINE CI/CD COMPLET RÉUSSI !'
            echo 'Déploiement automatique terminé avec succès'
        }
    }
}