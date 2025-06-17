pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonartoken')
        SONAR_HOST_URL = 'http://54.242.133.29:9000'
        scannerHome = tool 'sonarscanner'
    }

    tools {
        jdk 'jdk17'
        maven 'maven'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'github-cred', url: 'git@github.com:mohamedtahani/springboot-app-cicd.git'
            }
        }

        stage('Build and Unit Tests') {
            steps {
                echo "Running Maven build and tests..."
                sh 'mvn clean verify -f backend/pom.xml'
            }
        }

//       stage('Static Code Analysis - Checkstyle') {
//            steps {
//                echo "Running Checkstyle..."
//                sh 'mvn checkstyle:check -f backend/pom.xml'
//          }
//       }

        stage('Static Code Analysis - SonarQube') {
            steps {
                echo "Sending to SonarQube..."
                withSonarQubeEnv('sonarqube-server') {
                    sh """
                        mvn sonar:sonar \
                          -Dsonar.projectKey=devops-app \
                          -Dsonar.host.url=$SONAR_HOST_URL \
                          -Dsonar.login=$SONAR_TOKEN \
                          -f backend/pom.xml
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                echo "Waiting for SonarQube Quality Gate..."
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo "Code passed all checks"
        }
        failure {
            echo "Pipeline failed. Check logs for the failing stage."
        }
    }
}
