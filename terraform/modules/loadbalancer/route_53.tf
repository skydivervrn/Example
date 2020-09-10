resource "aws_route53_record" "this" {
  zone_id = var.route53_zone.id
  name    = "*.${var.dns_domain_subdomain}.${var.route53_zone.name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.this.dns_name]
}

resource "aws_route53_record" "this_base" {
  zone_id = var.route53_zone.id
  name    = "${var.dns_domain_subdomain}.${var.route53_zone.name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.this.dns_name]
}
