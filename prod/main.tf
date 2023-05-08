terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }

  backend "s3" {
    bucket         = "sk-terraform-state-bucket"
    key            = "terraform-prod.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "sk-terraform-state-lock"
    encrypt        = true
    role_arn       = "arn:aws:iam::542175737487:role/terraform-backend-access-role"
  }
}

provider "snowflake" {
  username    = "TF_DEMO"
  account     = "tt28218.ap-southeast-2"
  role        = "TERRAFORM_DEPLOYER"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}

module "kafka_stream" {
  source     = "../modules/kafka_stream"
  database   = var.database
  env_name   = var.env_name
  depends_on = [module.snowflake_resources]
}
