variable "vpc_name" {
  type = string
}

variable "availability_zones_mapping" {
  type = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "trusted_ipv4_cidr_blocks" {
  type = list(string)
  default = []
}
