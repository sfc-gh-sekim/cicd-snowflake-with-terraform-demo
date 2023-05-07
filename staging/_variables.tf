variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_PROD"
}

variable "env_name" {
  type    = string
  default = "PROD"
}

variable "snowflake_private_key" {
  type = string
  description = "Private key used to access Snowflake"
  sensitive = true
}