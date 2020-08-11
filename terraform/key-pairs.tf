variable "user_key_pair" {}

resource "aws_key_pair" "user" {
  key_name   = "user-key"
  public_key = var.user_key_pair
}

output "aws_key_pair_user" {
  value = aws_key_pair.user
}
