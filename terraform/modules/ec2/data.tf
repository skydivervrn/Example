data "aws_iam_policy_document" "assume_role_ec2_service" {
  statement {
    sid = "AssumeRolePolicy"
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
  }
}

data "aws_ami" "aws_ami_debian_buster" {
  most_recent = true

  name_regex = "^debian-10-.*$"
  owners = ["136693071363"]

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
