variable "source_tags" {
  type    = list(string)
  default = []
}

variable "target_tags" {
  type    = list(string)
  default = []
}

variable "tag_rules" {
   type = list(object({
       src_tag = list(string)
       dest_tag = list(string)
       cond = string
       protocol = list(string) 
       })
       )
}




locals {
  project_id = "terraform-cloudbuild"
  vm_configs = {
    "demo1" = {
      apm      = "bjmq"
      appgroup = "demo"
      region   = "northamerica-northeast1"
      zone     = "northamerica-northeast1-a"
      tags     = ["https-default"]
      create_compute_sa = true
      boot_disk = {
        initialize_params = {
          source_image_project = "nbcde-009-snapshot-08443"
          source_image         = "rhel9-soe-dev-2024-1122-1646-v0-cpu"
          size                 = 40
          type                 = "pd-balanced"
        }
      }
      attached_disks = [
        {  name        = "disk-1"
           size        = "20"
        },
        {  name        = "disk-2"
           size        = "30"
        }]
    reserve_static_ip = true

    instance_schedule = {
      create_config = {
      description     = "Temporary schedule"
      timezone        = "UTC"
      start_time      = "2025-02-27T10:00:00Z"
      expiration_time = "2025-02-29T18:00:00Z"
      vm_start        = "0 9 * * *"
      vm_stop         = "0 17 * * *"
     }
    }
    }
  }
}
