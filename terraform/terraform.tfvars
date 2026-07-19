aws_region         = "ap-south-1"
project_name       = "sarfaraz"
environment        = "dev"
cluster_name       = "sarfaraz-eks-auto"
kubernetes_version = "1.33"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

intra_subnets = [
  "10.0.21.0/24",
  "10.0.22.0/24"
]

ecr_repository_name = "sarfaraz-app"

tags = {
  Terraform   = "true"
  ManagedBy   = "terraform"
  Environment = "dev"
  Project     = "sarfaraz-eks-auto"
}