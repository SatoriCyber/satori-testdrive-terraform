############################################################################################
# SATORI SECURITY DATASETS 
############################################################################################


resource "satori_dataset" "mysql_dataset_definition1" {
  definition {
    name        = "satori dataset created with terraform test 1"
    description = "from satori terraform provider"
    #the service account must also be an owner to be able to modify settings beyond definition
    owners = [data.satori_user.data_steward.id]


    include_location {
      datastore = var.datastore_id
      relational_location {
        db     = var.db_name
        schema = var.db_schema
      }
    }

  }

  access_control_settings {
    enable_access_control = true
    enable_user_requests  = true
    enable_self_service   = true
  }


  custom_policy {
  }

  security_policies = [satori_security_policy.simple_masking_security_policy1.id]
}


resource "satori_dataset" "db_dataset_definition2" {
  definition {
    name        = "satori_dataset_definition terraform test 2"
    description = "2nd Satori Dataset created from satori terraform provider"
    owners      = [data.satori_user.data_steward.id]

    include_location {
      datastore = var.datastore_id
      relational_location {
        db     = var.db_name
        schema = var.db_schema
      }
    }

  }

  access_control_settings {
    enable_access_control = false
    enable_user_requests  = false
    enable_self_service   = false
  }

  custom_policy {
    #default priority is 100
    #priority =
    #rules_yaml = file("${path.module}/rules.yaml")
    #tags_yaml = file("${path.module}/tags.yaml")
  }

  security_policies = [satori_security_policy.simple_masking_security_policy1.id]
}