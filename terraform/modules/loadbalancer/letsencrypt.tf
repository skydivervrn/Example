resource "acme_certificate" "certificate" {
  account_key_pem  = var.tls_private_key
  common_name      = "*.${var.dns_domain_subdomain}.${var.cloudflare_domain_zone.name}"
  subject_alternative_names = ["${var.dns_domain_subdomain}.${var.cloudflare_domain_zone.name}"]

  dns_challenge {
    provider = "cloudflare"

    # Without this explicit config, the ACME provider (which uses lego
    # under the covers) will look for environment variables to use.
    # These environment variable names happen to overlap with the names
    # also required by the native Terraform AWS provider, however is not
    # guaranteed. You may want to explicitly configure them here if you
    # would like to use different credentials to those used by the main
    # Terraform provider
    config = {
      CF_DNS_API_TOKEN = var.cloudflare_token
    }
  }
}
