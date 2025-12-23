terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "eks_aws_official" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.9.0"

  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  # Har node group mein custom IAM Role inject karne ka sahi tarika
  eks_managed_node_groups = {
    for k, v in var.eks_managed_node_groups : k => merge(v, {
      iam_role_arn = var.node_iam_role_arn
    })
  }

  tags = var.tags
}