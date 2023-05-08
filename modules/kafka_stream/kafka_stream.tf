resource "snowflake_procedure" "kafka_stream" {
  name     = "SIMULATE_KAFKA_STREAM"
  database = var.database
  schema   = "PUBLIC"
  language = "JAVA"
  arguments {
    name = "mystage"
    type = "VARCHAR"
  }
  arguments {
    name = "prefix"
    type = "VARCHAR"
  }
  arguments {
    name = "numlines"
    type = "NUMBER"
  }
  comment             = "Stored proc that simulates a Kafka stream."
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  packages            = ["com.snowflake:snowpark:1.8.0"]
  null_input_behavior = "RETURNS NULL ON NULL INPUT"
  statement           = file("${path.module}/src/kafka_stream.java")
  handler             = "StreamDemo.run"
}