resource "statuscake_test" "healthchecks" {
  for_each = toset(flatten(values(var.port_url_mapping)))

  website_name   = "${each.key}.${var.cloudflare_domain_zone.name} - healthcheck"
  website_url    = "https://${each.key}.${var.cloudflare_domain_zone.name}/healthcheck"

//  final_endpoint = "/healthcheck"
  test_type      = "HTTP"
  contact_group  = ["169276",]
  test_tags      = ["https"]
  check_rate     = 30
  confirmations  = 1
  timeout        = 10
  trigger_rate   = 2
  node_locations = ["SG1", "RU1", "DUB2", "IS1", "DEFR-1", "HK"]
  find_string    = null
  status_codes   = "204,205,206,303,400,401,403,404,405,406,408,410,413,444,429,494,495,496,499,500,501,502,503,504,505,506,507,508,509,510,511,521,522,523,524,520,598,599"
  post_raw       = null
  custom_header  = null
  enable_ssl_alert = true
  follow_redirect = true
}
