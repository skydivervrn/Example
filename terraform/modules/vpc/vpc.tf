resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "vpc-${var.vpc_name}"
  }

  lifecycle {
    prevent_destroy = true
  }
}
