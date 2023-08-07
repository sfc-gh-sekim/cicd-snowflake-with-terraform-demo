variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "env_name" {
  type    = string
  default = "STAGING"
}

variable "snowflake_private_key_path" {
  type        = string
  description = "Private key used to access Snowflake"
  default = "~/.ssh/snowflake_tf_snow_key.p8"
}