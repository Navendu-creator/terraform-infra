variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.29"
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "node_groups" {
  type = any
  description = "Map of node group definitions for the module"
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}
