############################################################################################
# SATORI MASKING PROFILES
############################################################################################



resource "satori_masking_profile" "masking_profile_restrictive2" {
  name        = "Pii Suppression"
  description = "Pii Suppression - sample created via terraform"

  condition {
    type        = "REPLACE_STRING"
    replacement = "[Pii TERRAFORM CONFIG REDACTED]"
    truncate    = 1
    tag         = "c12n.pii"
  }

  condition {
    type        = "REPLACE_STRING"
    replacement = "[LPii TERRAFORM REDACTED]"
    truncate    = 1
    tag         = "c12n.piilinkable"
  }
}


resource "satori_masking_profile" "masking_profile_restrictive3" {
  name        = "Healthcare Analyst Suppression"
  description = "Healthcare Analyst Suppression sample created via terraform"

  condition {
    type        = "HASH"
    replacement = null
    truncate    = 1
    tag         = "c12n.phi"
  }

  condition {
    type        = "REPLACE_STRING"
    replacement = "[lpii TERRAFORM REDACTED]"
    truncate    = 1
    tag         = "c12n.piilinkable"
  }

  condition {
    type        = "TRUNCATE"
    replacement = null
    truncate    = 8
    tag         = "c12n.pii::email"
  }

  condition {
    type        = "REDACT"
    replacement = null
    tag         = "c12n_custom.custom category 1::custom cls1"
  }

  depends_on = [
    satori_custom_taxonomy_classifier.cls1
  ]

}
