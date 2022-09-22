############################################################################################
# SATORI CUSTOM TAXONOMY CREATION
############################################################################################

resource "satori_custom_taxonomy_category" "cat1" {
  name        = "custom category 1"
  description = "category from terraform"
  color       = "#3493eb"
}

resource "satori_custom_taxonomy_category" "cat2" {
  name        = "custom category 2"
  description = "category from terraform"
  color       = "#eb3434"
}

resource "satori_custom_taxonomy_category" "cat3" {
  name        = "custom category 3"
  description = "category from terraform"
  color       = "#137A3F"
}

resource "satori_custom_taxonomy_classifier" "cls1" {
  name                         = "custom cls1"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat1.id
  additional_satori_categories = ["pii"]
}

resource "satori_custom_taxonomy_classifier" "cls2" {
  name                         = "custom cls2"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat1.id
  additional_satori_categories = ["pii"]
}

resource "satori_custom_taxonomy_classifier" "cls3" {
  name                         = "custom cls3"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat1.id
  additional_satori_categories = ["pii"]
}

resource "satori_custom_taxonomy_classifier" "cls4" {
  name                         = "custom cls4"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat2.id
  additional_satori_categories = ["pii"]
}

resource "satori_custom_taxonomy_classifier" "cls5" {
  name                         = "custom cls5"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat2.id
  additional_satori_categories = ["pii"]
}

resource "satori_custom_taxonomy_classifier" "cls6" {
  name                         = "custom cls6"
  description                  = "custom classifier from terraform"
  type                         = "NON_AUTOMATIC"
  parent_category              = satori_custom_taxonomy_category.cat2.id
  additional_satori_categories = ["pii"]
}


resource "satori_custom_taxonomy_classifier" "cls8" {
  name            = "custom cls8"
  description     = "custom classifier from terraform"
  type            = "SATORI_BASED"
  parent_category = satori_custom_taxonomy_category.cat3.id
  satori_based_config {
    satori_base_classifier = "ADDRESS"
  }
  scope {
    datasets = [satori_dataset.mysql_dataset_definition1.id]
  }

}

resource "satori_custom_taxonomy_classifier" "cls9" {
  name            = "custom cls9"
  description     = "custom classifier from terraform"
  type            = "SATORI_BASED"
  parent_category = satori_custom_taxonomy_category.cat3.id
  satori_based_config {
    satori_base_classifier = "EMAIL"
  }

  scope {
    datasets = [satori_dataset.db_dataset_definition2.id]
  }

}