resource "snowflake_stage" "tf_demo_stage" {
  name        = "VHOL_STAGE"
  database    = snowflake_database.tf_demo_database.name
  schema      = snowflake_schema.tf_demo_schema.name
  file_format = "TYPE = JSON NULL_IF = [] COMPRESSION = auto STRIP_OUTER_ARRAY = true"
}

resource "snowflake_table" "tf_demo_table" {
  name            = "CC_TRANS_LANDING"
  database        = snowflake_database.tf_demo_database.name
  schema          = snowflake_schema.tf_demo_schema.name
  change_tracking = true

  column {
    name = "RECORD_CONTENT"
    type = "VARIANT"
  }
}

resource "snowflake_view" "cc_trans_landing_view" {
  name       = "CC_TRANS_LANDING_VIEW"
  database   = snowflake_database.tf_demo_database.name
  schema     = snowflake_schema.tf_demo_schema.name
  depends_on = [snowflake_table.tf_demo_table]

  statement = <<-SQL
    select
      RECORD_CONTENT:card:number::varchar card_id,
      RECORD_CONTENT:merchant:id::varchar merchant_id,
      RECORD_CONTENT:transaction:id::varchar transaction_id,
      RECORD_CONTENT:transaction:amount::float amount,
      RECORD_CONTENT:transaction:currency::varchar currency,
      RECORD_CONTENT:transaction:approved::boolean approved,
      RECORD_CONTENT:transaction:type::varchar type,
      RECORD_CONTENT:transaction:timestamp::datetime timestamp
    from CC_TRANS_LANDING
    SQL

  or_replace = false
  is_secure  = false
}

resource "snowflake_stream" "cc_landing_view_stream" {
  database = snowflake_database.tf_demo_database.name
  schema   = snowflake_schema.tf_demo_schema.name
  name     = "CC_TRANS_LANDING_VIEW_STREAM"

  on_view = "${snowflake_database.tf_demo_database.name}.${snowflake_schema.tf_demo_schema.name}.${snowflake_view.cc_trans_landing_view.name}"
}
