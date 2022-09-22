terraform {
  required_providers {
    satori = {
      source  = "SatoriCyber/satori"
      version = "0.0.12"
    }
    google = {
      source = "hashicorp/google"
    }

  }
}

provider "satori" {
  # Configuration options
  satori_account      = var.satori_account_id
  service_account     = var.satori_service_account_id
  service_account_key = var.satori_service_account_key
  url                 = var.satori_platform_url
}
