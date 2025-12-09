variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  validation {
    condition     = can(regex("^\d+\.\d+\.\d+\.\d+/\d+$", var.vpc_cidr))
    error_message = "vpc_cidr must be a valid CIDR (e.g. 10.0.0.0/16)"
  }
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones (optional; defaults to provider lookup)"
  default     = []
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Create NAT Gateways for private subnets"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
