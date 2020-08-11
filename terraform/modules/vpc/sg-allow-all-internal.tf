resource "aws_security_group" "allow_all_internal" {
  name        = "allow-all-internal"
  description = "Allow all internal traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = [for v in aws_subnet.this : v.cidr_block]
  }

  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = [for v in aws_subnet.this : v.cidr_block]
  }

  tags = {
    Name = "vpc-${var.vpc_name}-allow-all"
  }
}
