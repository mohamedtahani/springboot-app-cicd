pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonartoken')
        scannerHome = tool 'sonarscanner'

        AWS_REGION = 'us-east-1'
        BACKEND_ECR = '890742564895.dkr.ecr.us-east-1.amazonaws.com/springboot-backend'
        FRONTEND_ECR = '890742564895.dkr.ecr.us-east-1.amazonaws.com/springboot-frontend'
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

        stage('Static Code Analysis - SonarQube') {
            steps {
                echo "Sending to SonarQube..."
                withSonarQubeEnv('sonarqube-server') {
                    sh """
                        mvn sonar:sonar \
                          -Dsonar.projectKey=devops-app \
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

        stage('Build & Push Docker Images to ECR') {
            steps {
                echo "Building and pushing Docker images to ECR..."
                sh """
                    aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $BACKEND_ECR
                    aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $FRONTEND_ECR

                    docker compose -f docker-compose.yml build

                    docker tag backend $BACKEND_ECR:latest
                    docker tag frontend $FRONTEND_ECR:latest

                    docker push $BACKEND_ECR:latest
                    docker push $FRONTEND_ECR:latest

                    docker image rm $BACKEND_ECR:latest
                    docker image rm $FRONTEND_ECR:latest
                """
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Review logs for more details."
        }
    }
}
