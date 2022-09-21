############################################################################################
# SATORI SECURITY POLICIES
############################################################################################



resource "satori_security_policy" "simple_masking_security_policy1" {
  name = "simple security policy #1 created with terraform"
  profile {
    masking {
      active = true
      rule {
        id          = "1"
        description = "rule 1"
        active      = true
        criteria {
          condition = "IS"
          identity {
            type = "EVERYONE"
          }
        }
        action {
          type               = "APPLY_MASKING_PROFILE"
          masking_profile_id = satori_masking_profile.masking_profile_restrictive2.id
        }
      }

    }

    row_level_security {
      active = false
    }


  }
}




resource "satori_security_policy" "simple_masking_security_policy2" {
  name = "simple security policy #2 created with terraform"
  profile {
    masking {
      active = true
      rule {
        id          = "1"
        description = "rule 1"
        active      = true
        criteria {
          condition = "IS"
          identity {
            type = "EVERYONE"
          }
        }
        action {
          type               = "APPLY_MASKING_PROFILE"
          masking_profile_id = satori_masking_profile.masking_profile_restrictive2.id
        }
      }

    }

    row_level_security {
      active = false
    }


  }
}

