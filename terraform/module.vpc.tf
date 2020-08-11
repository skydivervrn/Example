variable "trusted_ipv4_cidr_blocks" {}
module "main_vpc" {
  source = "./modules/vpc"
  vpc_name = "main_vpc"
  trusted_ipv4_cidr_blocks = var.trusted_ipv4_cidr_blocks
}

output "main_vpc" {
  value = module.main_vpc
}
