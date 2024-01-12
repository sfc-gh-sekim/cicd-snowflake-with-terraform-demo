terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.73.0"
    }
  }
}

provider "snowflake" {
  # username    = "tf-snow"
  # region      = "us-east-2"
  account     = "lpkqvri-df00607"
  # account     = "ID00508"
  role        = "SYSADMIN"
  private_key_path = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}