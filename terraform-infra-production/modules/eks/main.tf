terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.9.0"

  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  node_groups = var.node_groups

  tags = var.tags
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_id
}
