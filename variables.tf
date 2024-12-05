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