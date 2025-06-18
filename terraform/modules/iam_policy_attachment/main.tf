resource "aws_iam_policy_attachment" "this" {
  name       = var.name
  policy_arn = var.policy_arn
  roles      = var.roles
}
