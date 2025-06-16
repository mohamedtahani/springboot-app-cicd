variable "backend_ecr_name" {
  description = "Name of the backend ECR repository"
  type        = string
}

variable "frontend_ecr_name" {
  description = "Name of the frontend ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "Image tag mutability"
  type        = string
  default     = "MUTABLE"
}

variable "force_delete" {
  description = "Allow force deletion of the ECR repo"
  type        = bool
  default     = false
}
