
pipeline {
    agent any

    tools {
        nodejs 'node-16.18.1'
    }

    stages {
        stage('Build Image Test') {
            steps {
                echo '==============build version============='
                sh 'docker-compose up -d --build'
            }
        }
    }
}
