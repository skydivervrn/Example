resource "aws_security_group" "allow_ssh" {
  name        = "ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow SSH connections from trusted IPs"
    from_port        = 22
    protocol         = "tcp"
    to_port          = 22
    cidr_blocks      = var.trusted_ipv4_cidr_blocks
  }

  tags = {
    Name = "vpc-${var.vpc_name}-ssh"
  }
}
