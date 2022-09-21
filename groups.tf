
############################################################################################
# IDP GROUPS CREATION
############################################################################################


resource "satori_directory_group" "group1" {
  name        = "group1 via terraform"
  description = "group created via terraform"

  member {
    type = "USERNAME"
    name = "local_user"
  }

  member {
    type = "IDP_GROUP"
    name = "group_name1"
    #OKTA, AZURE, ONELOGIN
    identity_provider = "OKTA"
  }

  member {
    type = "DB_ROLE"
    name = "role_name"
    #SNOWFLAKE, REDSHIFT, BIGQUERY, POSTGRESQL, ATHENA, MSSQL, SYNAPSE
    data_store_type = "SNOWFLAKE"
  }
}

resource "satori_directory_group" "group2" {
  name        = "group2 via terraform"
  description = "group with group from terraform"

  member {
    type = "USERNAME"
    name = "name"
  }

  member {
    type     = "DIRECTORY_GROUP"
    group_id = satori_directory_group.group1.id
  }

}

resource "satori_directory_group" "group3" {
  name        = "group3 via terraform"
  description = "group with group from terraform"

  member {
    type = "USERNAME"
    name = "name2"
  }

  member {
    type     = "DIRECTORY_GROUP"
    group_id = satori_directory_group.group1.id
  }

}

resource "satori_directory_group" "group4" {
  name        = "group4 via terraform"
  description = "Empty directory group"
}

data "satori_user" "data_steward" {
  email = var.admin_steward_email
}
