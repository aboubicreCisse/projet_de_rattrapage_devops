pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "tonusernamedocker/projet_de_rattrapage_devops:latest"
        DOCKER_CREDENTIALS_ID = "dockerhub-credentials"
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git url: 'https://github.com/aboubicreCisse/projet_de_rattrapage_devops.git', branch: 'main'
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "$DOCKER_CREDENTIALS_ID") {
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }

        stage('Déploiement') {
            steps {
                script {
                    sh '''
                    docker stop django_app || true
                    docker rm django_app || true
                    docker run -d --name django_app -p 8000:8000 $DOCKER_IMAGE
                    '''
                }
            }
        }
    }
}
