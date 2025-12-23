provider "aws" {
  region = var.region
}

module "networking" {
  source          = "../../modules/networking"
  vpc_name        = "dev-vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
}

module "iam" {
  source         = "../../modules/iam"
  role_name      = "dev-eks-role"
  assume_service = "eks.amazonaws.com"
  tags           = var.tags
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "dev-eks"
  k8s_version     = var.k8s_version
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
  eks_managed_node_groups = var.eks_managed_node_groups
  
  # Node role pass karna yahan se zaroori hai
  node_iam_role_arn = aws_iam_role.eks_nodes.arn 
  
  tags = var.tags
}

# --- WORKER NODE IAM ROLE (Root mein rahega) ---
resource "aws_iam_role" "eks_nodes" {
  name = "${var.env}-eks-node-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "node_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ])
  policy_arn = each.value
  role       = aws_iam_role.eks_nodes.name
}