resource "snowflake_database" "tf_demo_database" {
  name = var.database
  tag {
    name  = "CONTROL.ACC_LEVEL_TAGS.ENV"
    value = var.env_name
  }
}

resource "snowflake_schema" "tf_demo_schema" {
  database = snowflake_database.tf_demo_database.name
  name     = "TF_DEMO"
  tag {
    name  = "CONTROL.ACC_LEVEL_TAGS.ENV"
    value = var.env_name
  }
}
