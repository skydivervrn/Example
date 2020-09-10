resource "tls_private_key" "acme_registration_private_key" {
  algorithm = "RSA"
}

# Set up a registration using the registration private key
resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.acme_registration_private_key.private_key_pem
  email_address   = "aleksandr.boikov@example.com"
}

output "acme_registration_private_key" {
  value = tls_private_key.acme_registration_private_key.private_key_pem
}
