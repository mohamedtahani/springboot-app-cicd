variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
}