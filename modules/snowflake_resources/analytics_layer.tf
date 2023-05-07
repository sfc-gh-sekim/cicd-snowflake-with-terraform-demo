resource "snowflake_table" "cc_trans_all" {
  name                = "CC_TRANS_ALL"
  database            = snowflake_database.tf_demo_database.name
  schema              = snowflake_schema.tf_demo_schema.name
  data_retention_days = var.time_travel_in_days

  column {
    name = "CARD_ID"
    type = "VARCHAR"
  }

  column {
    name = "MERCHANT_ID"
    type = "VARCHAR"
  }

  column {
    name = "TRANSACTION_ID"
    type = "VARCHAR"
  }

  column {
    name = "AMOUNT"
    type = "FLOAT"
  }

  column {
    name = "CURRENCY"
    type = "VARCHAR"
  }

  column {
    name = "APPROVED"
    type = "BOOLEAN"
  }

  column {
    name = "TYPE"
    type = "VARCHAR"
  }

  column {
    name = "TIMESTAMP"
    type = "DATETIME"
  }

  tag {
    name  = "CONTROL.ACC_LEVEL_TAGS.ENV"
    value = var.env_name
  }
}