
resource "snowflake_stage" "tf_demo_stage" {
  name        = "VHOL_STAGE"
  database    = snowflake_database.tf_demo_database.name
  schema      = snowflake_schema.tf_demo_schema.name
  file_format = "( TYPE=JSON,STRIP_OUTER_ARRAY=TRUE )"
}

resource "snowflake_table" "tf_demo_table" {
  name                = "CC_TRANS_LANDING"
  database            = snowflake_database.tf_demo_database.name
  schema              = snowflake_schema.tf_demo_schema.name
  data_retention_days = var.time_travel_in_days

  column {
    name = "RECORD_CONTENT"
    type = "VARIANT"
  }
}

resource "snowflake_view" "cc_trans_landing_view" {
  name     = "CC_TRANS_LANDING_VIEW"
  database = snowflake_database.tf_demo_database.name
  schema   = snowflake_schema.tf_demo_schema.name

  statement = <<-SQL
        create or replace view CC_TRANS_LANDING_VIEW (card_id, merchant_id, transaction_id, amount, currency, approved, type, timestamp ) as (
        select
          RECORD_CONTENT:card:number::varchar card_id,
          RECORD_CONTENT:merchant:id::varchar merchant_id,
          RECORD_CONTENT:transaction:id::varchar transaction_id,
          RECORD_CONTENT:transaction:amount::float amount,
          RECORD_CONTENT:transaction:currency::varchar currency,
          RECORD_CONTENT:transaction:approved::boolean approved,
          RECORD_CONTENT:transaction:type::varchar type,
          RECORD_CONTENT:transaction:timestamp::datetime timestamp
        from CC_TRANS_LANDING);
    SQL

  or_replace = false
  is_secure  = false
}

resource "snowflake_stream" "cc_landing_view_stream" {
  database = snowflake_database.tf_demo_database.name
  schema   = snowflake_schema.tf_demo_schema.name
  name     = "CC_TRANS_LANDING_VIEW_STREAM"

  on_view = snowflake_view.cc_trans_landing_view.name
}
