terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.56.3"
    }
  }

  cloud {}
}

provider "snowflake" {
  account  = var.SNOWFLAKE_ACCOUNT
  region   = var.SNOWFLAKE_REGION
  user     = var.SNOWFLAKE_USER
  password = var.SNOWFLAKE_PASSWORD
}

resource "snowflake_database" "terraform_demo_db" {
  name    = "TERRAFORM_DEMO_DB_${terraform.workspace}"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "terraform_demo_schema" {
  database = snowflake_database.terraform_demo_db.name
  name     = "MY_NEW_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

