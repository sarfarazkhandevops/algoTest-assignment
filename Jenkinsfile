@Library('shared-library') _

pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dockerBuild()
            }
        }

        stage('Push') {
            steps {
                dockerPush()
            }
        }

        stage('Deploy') {
            steps {
                deployK8s(
                    "k8s/deployment.yaml",
                    "k8s/service.yaml"
                )
            }
        }

        stage('Verify') {
            steps {
                verifyDeployment()
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }

        failure {
            echo "Deployment Failed!"
        }
    }
}
