output "availability_zones_mapping" {
  value = var.availability_zones_mapping
}

output "subnets_mapping" {
  value = [for v in aws_subnet.this : v.id]
}

output "security_group_allow_all_internal" {
  value = aws_security_group.allow_all_internal.id
}

output "security_group_outgoing" {
  value = aws_security_group.outgoing.id
}

output "security_group_allow_ssh" {
  value = aws_security_group.allow_ssh.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
