resource "snowflake_database" "tf_demo_database" {
  name = var.database
}

# Set data retention period on DB
resource "snowflake_object_parameter" "o" {
  key         = "DATA_RETENTION_TIME_IN_DAYS"
  value       = var.time_travel_in_days
  object_type = "DATABASE"
  object_identifier {
    name = snowflake_database.tf_demo_database.name
  }
}

resource "snowflake_schema" "tf_demo_schema" {
  database = snowflake_database.tf_demo_database.name
  name     = "TF_DEMO"
}
