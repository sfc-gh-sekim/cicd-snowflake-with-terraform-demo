terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }


}

provider "snowflake" {
  username    = "tf-snow"
  account     = "jg85521.canada-central.azure"
  role        = "SYSADMIN"
  private_key_path = var.snowflake_private_key_path
  #"~/.ssh/snowflake_tf_snow_key.p8"
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}