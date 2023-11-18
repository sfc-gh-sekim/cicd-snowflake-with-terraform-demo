terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }

  backend "s3" {
    bucket   = "snowflake-tf-hc"
    key      = "terraform-staging.tfstate"
    region   = "us-east-1"
    encrypt  = true
    role_arn = "arn:aws:iam::610986689210:role/github-actions-terraform-role"
  }
}

# Primary Snowflake provider configuration
provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

# Resource definitions
resource "snowflake_user" "nganage" {
  name                 = "NGANAGE"
  comment              = "Nikhil Ganage, Data Eng, Contractor"
  default_namespace    = ""
  default_role         = "sysadmin"
  disabled             = false
  display_name         = "nganage"
  email                = "nikhil.ganage@gmail.com"
  first_name           = "Nikhil"
  last_name            = "Ganage"
  login_name           = "NGANAGE"
  must_change_password = null
  password             = null
  rsa_public_key       = null
  rsa_public_key_2     = null
}