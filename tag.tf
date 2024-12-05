module "firewall_tag_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = "terraform-cloudbuild"
  network_name = "projects/terraform-cloudbuild/global/networks/gce-shared-vpc"

  rules = [{
    name                    = "allow-epm-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    destination_ranges      = null
    source_ranges           = null
    source_tags             = var.source_tags
    source_service_accounts = null
    target_tags             = var.target_tags
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22","3389"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}