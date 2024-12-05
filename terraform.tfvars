source_tags = ["epm100","epm200"]
target_tags = ["epm100","epm200"]

tag_rules = [
     { src_tag = [ "epm100","epm200"],
       dest_tag = ["epm100","epm200"], 
       cond = "allow", 
       protocol = ["22"]
      },
]