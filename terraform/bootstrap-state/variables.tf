variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for TF state"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB lock table"
  type        = string
}
