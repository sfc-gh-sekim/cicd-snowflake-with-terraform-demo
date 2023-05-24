resource "snowflake_table" "demo_table" {
  database   = snowflake_database.tf_demo_database.name
  schema     = snowflake_schema.tf_demo_schema.name
  depends_on = [snowflake_table_grant.table_ro_grant]
  name       = "DEMO_TABLE"
  comment    = "An empty table for Terraform demo"

  column {
    name     = "id"
    type     = "NUMBER(38,0)"
    nullable = true
  }

  column {
    name     = "data"
    type     = "text"
    nullable = false
  }

  column {
    name = "DATE"
    type = "TIMESTAMP_NTZ(9)"
  }
}