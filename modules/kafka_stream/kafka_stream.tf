resource "snowflake_procedure" "kafka_stream" {
  name     = "SIMULATE_KAFKA_STREAM"
  database = var.database
  schema   = "PUBLIC"
  language = "JAVA"
  arguments {
    name = "mystage"
    type = "STRING"
  }
  arguments {
    name = "prefix"
    type = "STRING"
  }
  arguments {
    name = "numlines"
    type = "INTEGER"
  }
  comment             = "Stored proc that simulates a Kafka stream."
  return_type         = "STRING"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  packages            = ["com.snowflake:snowpark:latest"]
  null_input_behavior = "RETURNS NULL ON NULL INPUT"
  statement           = file("${path.module}/src/kafka_stream.java")
  handler             = "StreamDemo.run"
}