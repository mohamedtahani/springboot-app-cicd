module "sonarqube_sg" {
  source = "../../../modules/security_group"

  name        = "sonarqube-sg"
  description = "Allow SSH (22) and sonar UI (9000)"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 9000
      to_port     = 9000
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

module "sonarqube_ec2" {
  source            = "../../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  security_group_id = module.sonarqube_sg.security_group_id
  name              = "sonarqube-platform"
}
