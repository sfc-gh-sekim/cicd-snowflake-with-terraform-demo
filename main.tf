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
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "terraform_demo_db" {
  name    = "TERRAFORM_DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}