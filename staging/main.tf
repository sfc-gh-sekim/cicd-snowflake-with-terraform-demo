terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }

  backend "s3" {
    bucket         = "sk-terraform-state-bucket"
    key            = "terraform-staging.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "sk-terraform-state-lock"
    encrypt        = true
    role_arn       = "arn:aws:iam::542175737487:role/terraform-backend-access-role"
  }
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}

module "kafka_stream" {
  source   = "../modules/kafka_stream"
  database = var.database
  env_name = var.env_name
}