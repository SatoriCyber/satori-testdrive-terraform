############################################################################################
# SATORI ACCESS RULES
############################################################################################


resource "satori_access_rule" "accessrule_perm1_1" {
  # reference to owning dataset
  parent_data_policy = satori_dataset.mysql_dataset_definition1.data_policy_id
  # granted access level, OWNER, READ_WRITE, READ_ONLY
  access_level = "READ_ONLY"
  # identity can not be changed after creation
  identity {
    type = "EVERYONE"
  }
  # expire on must be in UTC
  # expire_on = "NEVER"
  # revoke_if_not_used_in_days = 90
}

