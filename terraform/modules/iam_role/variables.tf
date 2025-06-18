variable "name" {
  type        = string
  description = "IAM Role name"
}

variable "assume_role_policy" {
  type        = string
  description = "Assume role policy in JSON"
}

variable "description" {
  type        = string
  default     = ""
}
