resource "snowflake_task" "generate_task" {
  name          = "GENERATE_TASK"
  database      = snowflake_database.tf_demo_database.name
  schema        = snowflake_schema.tf_demo_schema.name
  schedule      = "1 minute"
  comment       = "Generates simulated real-time data for ingestion"
  sql_statement = "call SIMULATE_KAFKA_STREAM('@VHOL_STAGE','SNOW_',1000000);"
  enabled       = true
}

resource "snowflake_task" "process_files_task" {
  name          = "PROCESS_TASK"
  database      = snowflake_database.tf_demo_database.name
  schema        = snowflake_schema.tf_demo_schema.name
  schedule      = "3 minute"
  comment       = "Ingests Incoming Staging Datafiles into Staging Table"
  sql_statement = "copy into CC_TRANS_STAGING from @VHOL_STAGE PATTERN='.*SNOW_.*'"
  enabled       = true
}

resource "snowflake_task" "refine_task" {
  name          = "REFINE_TASK"
  database      = snowflake_database.tf_demo_database.name
  schema        = snowflake_schema.tf_demo_schema.name
  schedule      = "4 minute"
  comment       = "2.  ELT Process New Transactions in Landing/Staging Table into a more Normalized/Refined Table (flattens JSON payloads)"
  sql_statement = <<-SQL
    insert into CC_TRANS_ALL (
      select                     
        card_id
        , merchant_id
        , transaction_id
        , amount
        , currency
        , approved
        , type
        , timestamp
    from CC_TRANS_STAGING_VIEW_STREAM)
  SQL
  enabled       = true
  when          = "SYSTEM$STREAM_HAS_DATA('CC_TRANS_STAGING_VIEW_STREAM')"
}