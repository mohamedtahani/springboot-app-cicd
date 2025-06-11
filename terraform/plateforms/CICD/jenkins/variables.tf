variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID for Jenkins"
  type        = string
}

variable "key_name" {
  description = "SSH key name for Ansible access"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for SG creation"
  type        = string
}
