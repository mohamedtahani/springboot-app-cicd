terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-springboot-app"
    key            = "platform/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}