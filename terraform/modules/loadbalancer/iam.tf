resource "aws_iam_server_certificate" "elb_cert" {
  name_prefix       = "${var.dns_domain_subdomain}.${var.cloudflare_domain_zone.name}"
  certificate_body  = acme_certificate.certificate.certificate_pem
  certificate_chain = acme_certificate.certificate.issuer_pem
  private_key       = acme_certificate.certificate.private_key_pem

  lifecycle {
    create_before_destroy = true
  }
}
