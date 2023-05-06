resource "snowflake_database" "tf_demo_database" {
  name = var.database
}

resource "snowflake_schema" "tf_demo_schema" {
  database = snowflake_database.tf_demo_database.name
  name     = "TF_DEMO"
}
