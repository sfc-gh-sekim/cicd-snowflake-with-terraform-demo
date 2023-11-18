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

provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "SYSADMIN"
  private_key = var.snowflake_private_key
  alias       = "sys"
}

provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "SECURITYADMIN"
  private_key = var.snowflake_private_key
  alias       = "security"
}

module "snowflake_resources" {
  source                = "../modules/snowflake_resources"
  snowflake_private_key = var.snowflake_private_key
}
