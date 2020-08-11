resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc-${var.vpc_name}-gateway"
  }

  lifecycle {
    prevent_destroy = true
  }
}
