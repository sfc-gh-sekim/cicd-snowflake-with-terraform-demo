resource "snowflake_table" "cc_trans_all" {
  name                = "CC_TRANS_ALL"
  database            = snowflake_database.tf_demo_database.name
  schema              = snowflake_schema.tf_demo_schema.name

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
}