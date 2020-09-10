resource "aws_security_group" "elb_sg" {
  name        = "${replace(var.dns_domain_subdomain, "/[^a-z0-9]/", "-")}-sg-elb"
  description = "ELB security group"
  vpc_id      = var.vpc_id

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.trusted_ipv4_cidr_blocks
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instances_sg" {
  name        = "elb-${replace(var.dns_domain_subdomain, "/[^a-z0-9]/", "-")}-sg"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.port_url_mapping
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      security_groups = [aws_security_group.elb_sg.id]
    }
  }
}

output "instances_sg_id" {
  value = aws_security_group.instances_sg.id
}
