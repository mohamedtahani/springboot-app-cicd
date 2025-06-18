resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.roles)
  role       = var.roles[count.index]
  policy_arn = var.policy_arn
}
