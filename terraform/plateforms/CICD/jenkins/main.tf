module "jenkins_sg" {
  source = "../../../modules/security_group"

  name        = "jenkins-sg"
  description = "Allow SSH (22) and Jenkins UI (8080)"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "jenkins_ec2" {
  source            = "../../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  security_group_id = module.jenkins_sg.security_group_id
  name              = "jenkins-platform"
}
