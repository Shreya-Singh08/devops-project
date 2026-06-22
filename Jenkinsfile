pipeline {
    agent any
   
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

        stage('Run Java') {
            steps {
                bat 'java -cp app app'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t shreya0896/devops-project:v1 .'
            }
        }
    }
}