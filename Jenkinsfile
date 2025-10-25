pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo ' Building Docker image...'
                sh 'docker build -t jenkins-auto-app .'
            }
        }
        
        stage('Deploy Automatically') {
            steps {
                echo ' DEPLOYING APPLICATION...'
                sh '''
                    docker stop auto-app-$(date +%s) 2>/dev/null || true
                    docker run -d -p 8080:8000 --name auto-app-$(date +%s) jenkins-auto-app
                    echo "AUTOMATIC DEPLOYMENT SUCCESSFUL!"
                    echo " App URL: http://localhost:8080"
                    echo " Health: http://localhost:8080/health/"
                '''
            }
        }
    }
    
    post {
        success {
            echo ' AUTOMATED DEPLOYMENT WITH JENKINS WORKS!'
        }
    }
}
