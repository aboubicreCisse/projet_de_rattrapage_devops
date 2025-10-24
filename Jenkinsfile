pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git branch: 'main', url: 'https://github.com/aboubicreCisse/projet_de_rattrapage_devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Construction de l'image Docker..."
                sh 'docker build -t mon-app-devops .'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Exécution des tests Django..."
                sh 'docker run --rm mon-app-devops python manage.py test'
            }
        }

        stage('Deploy') {
            steps {
                echo "Déploiement du conteneur Docker..."
                sh 'docker stop mon-app || true && docker rm mon-app || true'
                sh 'docker run -d -p 8000:8000 --name mon-app mon-app-devops'
            }
        }
    }

    post {
        success {
            echo ' Pipeline exécuté avec succès !'
        }
        failure {
            echo ' Échec du pipeline.'
        }
    }
}
