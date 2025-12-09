variable "role_name" {
  type        = string
  description = "Role name"
}

variable "assume_service" {
  type        = string
  description = "Service principal that will assume the role (e.g. eks.amazonaws.com)"
  default     = "eks.amazonaws.com"
}

variable "inline_policies" {
  type        = map(string)
  description = "Map of inline policy name => JSON policy document"
  default     = {}
}
