variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.33"
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  description = "EKS managed node groups configuration"
  type        = map(any)
  default     = {}
}


variable "tags" {
  type = map(string)
  default = {}
}


variable "node_iam_role_arn" {
  type        = string
  description = "The ARN of the IAM role for the node group"
}