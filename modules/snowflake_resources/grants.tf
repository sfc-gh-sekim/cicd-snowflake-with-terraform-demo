resource "snowflake_database_grant" "database_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name

  privilege = "USAGE"
  roles     = ["TF_DEMO_READER"]
}

resource "snowflake_schema_grant" "schema_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "USAGE"
  roles     = ["TF_DEMO_READER"]
}

resource "snowflake_table_grant" "table_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "SELECT"
  roles     = ["TF_DEMO_READER"]

  on_future         = true
  with_grant_option = false
  on_all            = false
}

resource "snowflake_view_grant" "view_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "SELECT"
  roles     = ["TF_DEMO_READER"]

  on_future         = true
  with_grant_option = false
  on_all            = false
}

resource "snowflake_warehouse_grant" "warehouse_grant" {
  warehouse_name = snowflake_warehouse.task_warehouse.name
  privilege      = "USAGE"
  roles          = ["TF_DEMO_READER"]
}