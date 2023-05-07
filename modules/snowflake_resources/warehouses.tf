resource "snowflake_warehouse" "task_warehouse" {
  name           = var.env_name == "PROD" ? "VHOL_TASK_WAREHOUSE" : "VHOL_TASK_WAREHOUSE_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  auto_resume    = true
  auto_suspend   = 1
  tag {
    name  = "CONTROL.ACC_LEVEL_TAGS.ENV"
    value = var.env_name
  }
}
