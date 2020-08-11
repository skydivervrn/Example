output "public_ip" {
  value = aws_eip.public_eip.*.public_ip
}

output "private_ip" {
  value = aws_instance.instance.*.private_ip
}

output "instance_ids" {
  value = aws_instance.instance.*.id
}

output "instance_names" {
  value = aws_instance.instance.*.tags.Name
}
