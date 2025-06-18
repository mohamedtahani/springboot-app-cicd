variable "name" {
  description = "Name of the attachment"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the policy to attach"
  type        = string
}

variable "roles" {
  description = "List of IAM role names to attach to"
  type        = list(string)
}
