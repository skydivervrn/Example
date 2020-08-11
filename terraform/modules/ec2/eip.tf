resource "aws_eip" "public_eip" {
  count = var.instances_count

  instance = aws_instance.instance.*.id[count.index]
  vpc = true

  lifecycle {
    prevent_destroy = true
  }
}
