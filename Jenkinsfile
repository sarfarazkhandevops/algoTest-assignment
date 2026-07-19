@Library('shared-library') _

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dockerBuild("flask-app")
            }
        }

        stage('Push') {
            steps {
                dockerPush(
                    "flask-app",
                    "ap-south-1",
                    "123456789012",
                    "flask-app"
                )
            }
        }

        stage('Deploy') {
            steps {
                deployK8s(
                    "eks-auto-cluster",
                    "ap-south-1",
                    "k8s/deployment.yaml",
                    "k8s/service.yaml",
                    "123456789012",
                    "flask-app"
                )
            }
        }
    }
}
