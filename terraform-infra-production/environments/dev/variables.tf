variable "env" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "k8s_version" {
  type    = string
  default = "1.33"
}

variable "node_groups" {
  type    = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}


variable "azs" {
  type = list(string)
  description = "Availability zones for networking module"
}


variable "eks_managed_node_groups" {
  type        = any
  description = "EKS managed node groups configuration"
  default     = {}
}
