resource "aws_subnet" "this" {
  for_each = toset(var.availability_zones_mapping)
  availability_zone               = each.key
  cidr_block                      = format("172.16.%d.0/24", 3 + index(var.availability_zones_mapping, each.key))
  map_public_ip_on_launch         = true
  vpc_id                          = aws_vpc.main.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route_table_association" "this" {
  for_each = toset(var.availability_zones_mapping)
  route_table_id = aws_route_table.default.id
  subnet_id      = aws_subnet.this[each.key].id
}
