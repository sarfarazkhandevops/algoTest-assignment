@Library('shared-library') _

pipeline {
    agent any

    environment {
        AWS_REGION  = "ap-south-1"
        ACCOUNT_ID  = "123456789012"
        REPOSITORY  = "flask-app"
        CLUSTER_NAME = "eks-auto-cluster"
        IMAGE = "flask-app"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                dockerBuild(IMAGE)
            }
        }

        stage('Push to ECR') {
            steps {
                dockerPush(
                    IMAGE,
                    AWS_REGION,
                    ACCOUNT_ID,
                    REPOSITORY
                )
            }
        }

        stage('Deploy') {
            steps {
                deployK8s(
                    CLUSTER_NAME,
                    AWS_REGION,
                    "k8s/deployment.yaml",
                    "k8s/service.yaml",
                    ACCOUNT_ID,
                    REPOSITORY
                )
            }
        }

        stage('Verify') {
            steps {
                verifyDeployment("flask-service")
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }

        failure {
            echo 'Deployment Failed!'
        }
    }
}
