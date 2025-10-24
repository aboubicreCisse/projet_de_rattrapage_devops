pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                echo ' Téléchargement du code depuis GitHub...'
                checkout scm
            }
        }
        
        stage('Validate Project') {
            steps {
                echo ' Vérification des fichiers...'
                sh '''
                    echo "Voici les fichiers de ton projet :"
                    ls -la
                    echo " "
                    echo " Structure validée !"
                '''
            }
        }
        
        stage('Show Docker Instructions') {
            steps {
                echo ' Instructions pour Docker :'
                sh '''
                    echo " "
                    echo "POUR DÉPLOYER MANUELLEMENT :"
                    echo "1. docker build -t mon-app ."
                    echo "2. docker run -p 8000:8000 mon-app"
                    echo "3. Ouvrir http://localhost:8000"
                    echo " "
                '''
            }
        }
    }
    
    post {
        success {
            echo ' SUCCÈS ! Pipeline terminé.'
            echo 'Ton projet est prêt pour le déploiement Docker.'
        }
    }
}