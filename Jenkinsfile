pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo '🚀 DÉMARRAGE DU PIPELINE AUTOMATISÉ'
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo '🐳 CONSTRUCTION AUTOMATIQUE DE L IMAGE DOCKER...'
                sh 'docker build -t jenkins-auto-app .'
                echo '✅ IMAGE DOCKER CONSTRUITE AVEC SUCCÈS'
            }
        }
        
        stage('Deploy Automatically') {
            steps {
                echo '🚀 DÉPLOIEMENT AUTOMATIQUE EN COURS...'
                sh '''
                    echo "=== LANCEMENT DU DÉPLOIEMENT AUTOMATIQUE ==="
                    docker stop auto-app-$(date +%s) 2>/dev/null || echo "Aucun conteneur précédent"
                    docker run -d -p 8080:8000 --name auto-app-$(date +%s) jenkins-auto-app
                    echo "✅ DÉPLOIEMENT AUTOMATIQUE RÉUSSI !"
                    echo "🌐 APPLICATION : http://localhost:8080"
                    echo "🏥 HEALTH CHECK : http://localhost:8080/health/"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 OBJECTIF ATTEINT : DÉPLOIEMENT AUTOMATISÉ AVEC JENKINS !'
            echo 'L application a été déployée automatiquement à chaque modification du code.'
        }
    }
}
