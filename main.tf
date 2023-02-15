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
      name = var.ENVIRONMENT
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "terraform_demo_db" {
  name    = "TERRAFORM_DEMO_DB_${terraform.workspace}"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "terraform_demo_schema" {
  name    = snowflake_database.terraform_demo_db.name
  comment = "Schema for Snowflake Terraform demo"
}

