resource "snowflake_database_grant" "database_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name

  privilege = "USAGE"
  roles     = [snowflake_role.tf_demo_reader_role]
}

resource "snowflake_schema_grant" "schema_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "USAGE"
  roles     = [snowflake_role.tf_demo_reader_role]
}

resource "snowflake_table_grant" "table_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "SELECT"
  roles     = [snowflake_role.tf_demo_reader_role]

  on_future         = false
  with_grant_option = false
  on_all            = true
}

resource "snowflake_view_grant" "view_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema.name

  privilege = "SELECT"
  roles     = [snowflake_role.tf_demo_reader_role]

  on_future         = false
  with_grant_option = false
  on_all            = true
}