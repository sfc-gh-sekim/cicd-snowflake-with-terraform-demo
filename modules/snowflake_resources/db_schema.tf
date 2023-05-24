resource "snowflake_database" "tf_demo_database" {
  name                        = var.database
  data_retention_time_in_days = var.time_travel_in_days
}

resource "snowflake_schema" "tf_demo_schema" {
  database = snowflake_database.tf_demo_database.name
  name     = "TF_DEMO"
}
