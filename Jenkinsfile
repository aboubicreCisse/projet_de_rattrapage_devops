pipeline {
    agent any

    stages {
        stage('Checkout Git') {
            steps {
                echo 'Récupération du code depuis GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Construction automatique de l image Docker...'
                sh 'docker build -t auto-deploy-app .'
            }
        }

        stage('Automatic Deployment') {
            steps {
                echo 'DÉPLOIEMENT AUTOMATIQUE EN COURS...'
                sh '''
                    echo "=== DÉPLOIEMENT AUTOMATIQUE JENKINS ==="
                    docker stop jenkins-auto-app || echo "Aucun conteneur à arrêter"
                    docker rm jenkins-auto-app || echo "Aucun conteneur à supprimer"
                    docker run -d -p 8080:8000 --name jenkins-auto-app auto-deploy-app
                    echo "DÉPLOIEMENT AUTOMATIQUE RÉUSSI"
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Vérification du déploiement...'
                sh '''
                    sleep 5
                    echo "=== VÉRIFICATION ==="
                    docker ps
                    echo "NOUVELLE APPLICATION : http://localhost:8080"
                    echo "HEALTH CHECK : http://localhost:8080/health/"
                    echo "DÉPLOYÉ AUTOMATIQUEMENT PAR JENKINS"
                '''
            }
        }
    }

    post {
        success {
            echo 'OBJECTIF ATTEINT : DÉPLOIEMENT AUTOMATISÉ AVEC JENKINS !'
            echo 'L application a été déployée automatiquement sur le port 8080'
        }
    }
}
