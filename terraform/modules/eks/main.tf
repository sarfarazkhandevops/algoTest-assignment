module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnet_ids
  control_plane_subnet_ids = var.control_plane_subnets

  endpoint_public_access  = true
  endpoint_private_access = true

  enable_irsa = true

  compute_config = {
    enabled    = true
    node_pools = ["system", "general-purpose"]
  }

  tags = var.tags
}