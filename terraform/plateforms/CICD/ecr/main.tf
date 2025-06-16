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
