module "backend_ecr" {
  source         = "../../../modules/ecr"
  name           = var.backend_ecr_name
  image_tag_mutability = var.image_tag_mutability
  force_delete   = var.force_delete
}

module "frontend_ecr" {
  source         = "../../../modules/ecr"
  name           = var.frontend_ecr_name
  image_tag_mutability = var.image_tag_mutability
  force_delete   = var.force_delete
}
module "ecr_push_role" {
  source              = "../../../modules/iam_role"
  name                = "jenkins-ecr-push-role"
  description         = "Role to allow Jenkins to push to ECR"
  assume_role_policy  = file("${path.module}/assume-role-policy.json")
}

module "ecr_push_policy" {
  source      = "../../../modules/iam_policy"
  name        = "ecr-push-policy"
  description = "Allows ECR actions"
  policy      = file("${path.module}/ecr-push-policy.json")
}

module "ecr_policy_attach" {
  source      = "../../../modules/iam_policy_attachment"
  name        = "jenkins-ecr-attach"
  policy_arn  = module.ecr_push_policy.policy_arn
  roles       = [module.ecr_push_role.role_name]
}

module "ecr_instance_profile" {
  source     = "../../../modules/iam_instance_profile"
  name       = "jenkins-instance-profile"
  role_name  = module.ecr_push_role.role_name
}
