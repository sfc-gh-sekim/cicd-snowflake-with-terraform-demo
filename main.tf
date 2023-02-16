terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.56.3"
    }
  }

  backend "remote" {
    organization = "sean-kim-demo-corp"

    workspaces {
      name = "PROD"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB_${terraform.workspace}"
  comment = "Database for Snowflake Terraform demo"
}