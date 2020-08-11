resource "aws_security_group" "outgoing" {
  name        = "outgoing"
  description = "Allow all outgoing traffic"
  vpc_id      = aws_vpc.main.id

  egress {
    description      = "Any"
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vpc-${var.vpc_name}-outgoing"
  }
}
