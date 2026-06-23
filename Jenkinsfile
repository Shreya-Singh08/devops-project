pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shreya0896/devops-project:v1"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/Shreya-Singh08/devops-project.git'
            }
        }

        stage('Build Java') {
            steps {
                bat 'javac app\\app.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat '''
                    docker login -u %DOCKER_USER% -p %DOCKER_PASS%
                    docker push %DOCKER_IMAGE%
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat '''
                set KUBECONFIG=C:\\Users\\Lenovo\\.kube\\config
                kubectl config current-context
                kubectl get nodes
                kubectl apply -f kubernetes\\deployment.yaml
                kubectl apply -f kubernetes\\service.yaml
                '''
            }
        }
    }
}