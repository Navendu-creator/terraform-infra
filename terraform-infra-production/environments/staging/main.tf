provider "aws" {
  region = var.region
}

module "networking" {
  source          = "../../modules/networking"
  vpc_name        = "staging-vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = var.tags
}

module "iam" {
  source    = "../../modules/iam"
  role_name = "staging-eks-role"
  assume_service = "eks.amazonaws.com"
  tags = var.tags
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "staging-eks"
  k8s_version     = var.k8s_version
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
  node_groups     = var.node_groups
  tags = var.tags
}
