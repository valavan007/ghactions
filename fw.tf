
terraform {

  backend "gcs" {
    bucket = "valtestdp" # need to update with the bucket name
    prefix = "state"
  }
}

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = "terraform-cloudbuild"
  network_name = "projects/terraform-cloudbuild/global/networks/gce-shared-vpc"

  rules = [{
    name                    = "allow-ssh-rdp-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    destination_ranges      = ["10.1.0.0/24"]
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
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