variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the public subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZs to deploy subnets in (e.g. [\"us-east-1a\", \"us-east-1b\"])"
}