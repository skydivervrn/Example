resource "cloudflare_record" "ns1" {
  for_each = toset(flatten(values(var.port_url_mapping)))
  zone_id = var.cloudflare_domain_zone.id
  name    = each.key
  value = var.route53_zone.name_servers[0]
  type    = "NS"
}

resource "cloudflare_record" "ns2" {
  for_each = toset(flatten(values(var.port_url_mapping)))
  zone_id = var.cloudflare_domain_zone.id
  name    = each.key
  value = var.route53_zone.name_servers[1]
  type    = "NS"
}

resource "cloudflare_record" "cname" {
  for_each = var.dns_domain_subdomain == "" ? toset(flatten(values(var.port_url_mapping))) : []
  zone_id = var.cloudflare_domain_zone.id
  name    = each.key
  value   = "${each.key}.${trim(var.route53_zone.name, ".")}"
  type    = "CNAME"
  proxied = true
}
