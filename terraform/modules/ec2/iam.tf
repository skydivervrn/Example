resource "aws_iam_instance_profile" "this" {
  name = var.base_name
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name = var.base_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_ec2_service.json
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.policy_arn_list)
  role = aws_iam_role.this.name
  policy_arn = var.policy_arn_list[count.index]
}
