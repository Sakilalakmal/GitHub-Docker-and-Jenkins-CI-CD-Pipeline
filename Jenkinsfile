pipeline {
    agent any 
    
    stages { 
        stage('Build Docker Image') {
            steps {  
                bat 'docker build -t sakilalakmal/nodeapp-cuban:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([
                    string(credentialsId: 'docker-username', variable: 'DOCKER_USERNAME'),
                    string(credentialsId: 'sakila-dockerhub-pw', variable: 'DOCKER_PASSWORD')
                ]) {
                    script {
                        bat "docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push sakilalakmal/nodeapp-cuban:%BUILD_NUMBER%'
            }
        }
    }
    post {
        always {
            bat 'docker logout'
        }
    }
}
