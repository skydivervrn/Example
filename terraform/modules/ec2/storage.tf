resource "aws_ebs_volume" "storage" {
  count = var.add_volume ? var.instances_count : 0

  availability_zone = var.instance_availability_zones_mapping[count.index]
  size = var.instance_storage_size
  type = var.instance_storage_type

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_volume_attachment" "storage" {
  count = var.add_volume ? var.instances_count : 0

  device_name = "xvdd"
  instance_id = aws_instance.instance.*.id[count.index]
  volume_id = aws_ebs_volume.storage.*.id[count.index]
}
