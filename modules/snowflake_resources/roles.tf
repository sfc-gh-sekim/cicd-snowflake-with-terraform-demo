resource "snowflake_role" "tf_demo_reader_role" {
  name    = "TF_DEMO_READER_${var.env_name}"
  comment = "Reader role for Terraform demo"
}

resource "snowflake_role_grants" "tf_demo_reader_role_grant" {
  role_name = snowflake_role.tf_demo_reader_role.name

  users = [
    "TF_DEMO_READER"
  ]
}