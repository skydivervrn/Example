variable "cloudflare_domain_zone" {
  type = map(string)
}

variable "cloudflare_token" {}

variable "dns_domain_subdomain" {
  type = string
  default = ""
}

variable "port_url_mapping" {}

variable "route53_zone" {}

variable "subnet_id_list" {
  type = list(string)
}

variable "tls_private_key" {
  type = string
}

variable "trusted_ipv4_cidr_blocks" {
  type = list(string)
  default = []
  description = "List of IPs (as string) in CIDR format"
}

variable "instance_id_list" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
