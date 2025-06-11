terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-springboot-app"
    key            = "platforms/CICD/sonar/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
