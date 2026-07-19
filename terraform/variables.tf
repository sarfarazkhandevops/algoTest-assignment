variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used as prefix for resources"
  type        = string
  default     = "eks-auto"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs for EKS nodes/pods"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "intra_subnets" {
  description = "Intra subnet CIDRs for internal workloads if needed"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-auto-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
  default     = "1.33"
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "eks-auto-app"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Terraform   = "true"
    ManagedBy   = "terraform"
    Environment = "dev"
  }
}



