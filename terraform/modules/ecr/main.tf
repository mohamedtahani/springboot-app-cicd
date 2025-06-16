resource "aws_ecr_repository" "this" {
    name = var.name
    image_tag_mutability = var.image_tag_mutability
    force_delete = var.force_delete

    encryption_configuration {
        encryption_type = "AES256"
    }
}