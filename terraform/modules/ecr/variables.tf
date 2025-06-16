variable "name" {
    description = "name of the ECR repository"
    type        = string
}

variable "image_tag_mutability" {
    description = "tag mutability of the ECR repository"
    type        = string
    default     = "MUTABLE"
}
variable "force_delete" {
    description = "whether to force delete the ECR repository"
    type        = bool
    default     = false
}