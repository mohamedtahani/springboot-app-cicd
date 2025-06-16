pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonartoken')
        SONAR_HOST_URL = 'http://54.164.105.9:9000'
    }

    tools {
        jdk 'jdk17'
        maven 'maven'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-cred', url: 'git@github.com:mohamedtahani/springboot-app-cicd.git'
            }
        }

        stage('Build + Test + Checkstyle') {
            steps {
                sh 'mvn clean verify checkstyle:check -f backend/pom.xml'
            }
        }

        stage('SonarQube Analysis') {
            steps {
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
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo "✅ Code analysis passed!"
        }
        failure {
            echo "❌ Pipeline failed during build or analysis"
        }
    }
}
