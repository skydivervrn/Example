resource "aws_instance" "instance" {
  count = var.instances_count

  availability_zone = var.instance_availability_zones_mapping[count.index % length(var.instance_availability_zones_mapping)] // If instances count will be more then az count it's prevent crash
  ami = data.aws_ami.aws_ami_ubuntu.id
  instance_type = var.instance_type
  monitoring = true
  ebs_optimized = true
  key_name = var.instance_key_name
  subnet_id = var.instance_subnets_mapping[count.index]
  iam_instance_profile = aws_iam_instance_profile.this.name
  vpc_security_group_ids = var.instance_vpc_security_group_ids
  associate_public_ip_address = false

  root_block_device {
    volume_type = "gp2"
    volume_size = var.instance_root_device_size
  }
  credit_specification {
    cpu_credits = "standard"
  }
  tags = merge(
  var.instance_tags,
  map(
  "Name", join("-", [var.base_name, count.index + 1])
  ),
  )

  lifecycle {
    ignore_changes  = [
//      ami,
      key_name,
      associate_public_ip_address,
    ]
//    prevent_destroy = true
  }
}
