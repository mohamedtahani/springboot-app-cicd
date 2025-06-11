variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet to launch into"
}

variable "security_group_id" {
  type        = string
  description = "SG with SSH + Jenkins ports"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "name" {
  type        = string
  description = "Instance tag name"
}
