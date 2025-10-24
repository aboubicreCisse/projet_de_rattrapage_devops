pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'aboubicrecisse/projet_de_rattrapage_devops'
        DOCKER_TAG = "latest"
    }
    
    stages {
        stage('Checkout Git') {
            steps {
                echo '📦 Récupération du code depuis GitHub...'
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo ' Construction de l image Docker...'
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }
        
        stage('Test Application') {
            steps {
                echo ' Test de l application Django...'
                sh 'docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} python manage.py check'
            }
        }
        
        stage('Deploy Application') {
            steps {
                echo ' Déploiement de l application...'
                sh '''
                    # Arrêter l ancien conteneur si il existe
                    docker stop django-app || true
                    docker rm django-app || true
                    
                    # Lancer le nouveau conteneur
                    docker run -d -p 8000:8000 --name django-app ${DOCKER_IMAGE}:${DOCKER_TAG}
                    
                    echo "✅ Conteneur déployé avec succès"
                '''
            }
        }
        
        stage('Verify Deployment') {
            steps {
                echo '🔍 Vérification du déploiement...'
                sh '''
                    sleep 5
                    echo "📊 Conteneurs en cours d exécution :"
                    docker ps
                    echo "🌐 Test d accès à l application..."
                    curl -s http://localhost:8000/health/ || echo "Application en cours de démarrage"
                '''
            }
        }
    }
    
    post {
        success {
            echo ' PIPELINE CI/CD COMPLET RÉUSSI !'
            echo '==================================='
            echo ' Application disponible : http://localhost:8000'
            echo ' Health Check : http://localhost:8000/health/'
            echo ' Image Docker : ${DOCKER_IMAGE}:${DOCKER_TAG}'
            echo '==================================='
        }
        failure {
            echo '❌ Pipeline échoué'
        }
    }
}