# AlgoTest DevOps Assignment

## Overview

This project demonstrates an end-to-end DevOps CI/CD pipeline for deploying a **Flask** application on **Amazon EKS Auto Mode** using modern DevOps practices.

The solution includes:

- Dockerized Flask application
- Docker Compose for local development
- Infrastructure provisioning with Terraform
- Kubernetes deployment manifests
- Jenkins Declarative Pipeline
- Jenkins Shared Library
- Amazon ECR for container image storage
- Amazon EKS Auto Mode for application deployment

---

## Repositories

### Application Repository

https://github.com/sarfarazkhandevops/algoTest-assignment

### Jenkins Shared Library

https://github.com/sarfarazkhandevops/algoTest-shared-library

---

# Architecture

```
                   +------------------+
                   |   Developer      |
                   +---------+--------+
                             |
                             v
                      Push Code to GitHub
                             |
                             v
                    Jenkins Declarative Pipeline
                             |
        +--------------------+--------------------+
        |                                         |
        v                                         v
 Docker Build & Test                    Terraform Provisioning
        |                                         |
        |                                   AWS Infrastructure
        |                                   (EKS + ECR + VPC)
        |                                         |
        +--------------------+--------------------+
                             |
                             v
                     Push Image to Amazon ECR
                             |
                             v
                  Deploy to Amazon EKS Auto Mode
                             |
                             v
                 Kubernetes Deployment & Service
                             |
                             v
                      Flask Application Running
```

---

# Repository Structure

```
algoTest-assignment/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
│
├── terraform/
│   ├── backend.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── main.tf
│   ├── Jenkinsfile
│   └── modules/
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── Jenkinsfile
└── README.md
```

### Shared Library

```
algoTest-shared-library/
│
├── vars/
│   ├── checkoutCode.groovy
│   ├── dockerBuild.groovy
│   ├── dockerPush.groovy
│   ├── deployToK8s.groovy
│   └── verifyDeployment.groovy
│
└── README.md
```

---

# Technology Stack

- Python Flask
- Docker
- Docker Compose
- Terraform
- Kubernetes
- Jenkins
- Jenkins Shared Library
- Amazon ECR
- Amazon EKS Auto Mode
- AWS IAM Instance Profile
- GitHub

---

# Step 1 - Docker

The Flask application is containerized using Docker.

### Features

- Python base image
- Installs dependencies from `requirements.txt`
- Exposes port **5001**
- Starts the Flask application

### Build Image

```bash
docker build -t flask-app .
```

### Run Container

```bash
docker run -p 5001:5001 flask-app
```

### Verify

```
http://localhost:5001
```

Expected Response

```
Hello, World from Flask!
```

---

# Step 2 - Local Development

Docker Compose is used for local development.

### Start Application

```bash
docker compose up --build
```

Application URL

```
http://localhost:5001
```

### Benefits

- Easy local development
- Automatic container recreation
- Simple testing environment

---

# Step 3 - Infrastructure Provisioning

Infrastructure is provisioned using **Terraform** through a dedicated Jenkins pipeline located in:

```
terraform/Jenkinsfile
```

### Resources Created

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Amazon ECR Repository
- Amazon EKS Auto Mode Cluster

### Remote Backend

Terraform state is stored securely using:

- Amazon S3
- DynamoDB (State Locking)

### Terraform Commands

```bash
terraform init

terraform plan

terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
```

---

# Step 4 - Kubernetes Deployment

The application is deployed using Kubernetes manifests.

### Resources

- Deployment
- Service (NodePort)

### Deployment Features

- Replica configuration
- Resource Requests
- Resource Limits
- Environment Variables
- Rolling Updates

### Deploy

```bash
kubectl apply -f k8s/
```

### Verify

```bash
kubectl get pods

kubectl get deployment

kubectl get svc
```

### Access Application

```bash
kubectl port-forward svc/flask-app-service 5001:5001
```

Visit

```
http://localhost:5001
```

---

# Step 5 - Jenkins CI/CD Pipeline

The CI/CD pipeline automates application deployment.

### Pipeline Stages

1. Checkout Source Code
2. Build Docker Image
3. Authenticate with Amazon ECR
4. Push Docker Image
5. Deploy to Amazon EKS
6. Verify Deployment

### Deployment Verification

```bash
kubectl rollout status deployment/flask-app

kubectl port-forward svc/flask-app-service 5001:5001

curl http://localhost:5001
```

---

# Jenkins Shared Library

Pipeline logic is separated into reusable shared library functions.

### Available Functions

- checkoutCode()
- dockerBuild()
- dockerPush()
- deployToK8s()
- verifyDeployment()

### Benefits

- Reusable pipeline code
- Cleaner Jenkinsfile
- Easier maintenance
- Modular CI/CD design

---

# Prerequisites

- AWS CLI
- Docker
- Terraform
- kubectl
- Jenkins
- Git

---

# Clone the Repositories

### Application Repository

```bash
git clone https://github.com/sarfarazkhandevops/algoTest-assignment.git

cd algoTest-assignment
```

### Shared Library

```bash
git clone https://github.com/sarfarazkhandevops/algoTest-shared-library.git
```

---

# CI/CD Workflow

```
Developer
    │
    ▼
GitHub
    │
    ▼
Jenkins
    │
    ▼
Build Docker Image
    │
    ▼
Push Image to Amazon ECR
    │
    ▼
Deploy to Amazon EKS Auto Mode
    │
    ▼
Kubernetes Deployment
    │
    ▼
Flask Application
```

---

# Security

- AWS Instance Profile used instead of static AWS credentials
- Jenkins Credentials Store for sensitive information
- Terraform Remote State with S3 and DynamoDB
- Kubernetes deployments managed using `kubectl`
- Docker images stored securely in Amazon ECR

---

# Future Enhancements

- Helm Charts
- ArgoCD (GitOps)
- Prometheus Monitoring
- Grafana Dashboards
- AWS Load Balancer Controller
- Ingress
- HTTPS using AWS ACM
- Automated Rollback
- SonarQube & Trivy Security Scans

---

# Author

## Sarfaraz Ali Khan

**DevOps Engineer**

### GitHub

https://github.com/sarfarazkhandevops

### LinkedIn

https://www.linkedin.com/in/sarfarazalikhandevops
