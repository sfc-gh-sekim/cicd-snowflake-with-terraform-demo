/*
  Snowball Warehouse (Data Team)
*/


provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "SYSADMIN"
  private_key = var.snowflake_private_key
  alias       = "sys"
}

provider "snowflake" {
  username    = "CICDDEPLOYER"
  account     = "walqygi-hrb94914"
  role        = "SECURITYADMIN"
  private_key = var.snowflake_private_key
  alias       = "security"
}


resource "snowflake_warehouse" "snowball" {
  name                         = "SNOWBALL"
  auto_resume                  = true
  auto_suspend                 = 60
  initially_suspended          = null
  warehouse_size               = "Medium"
  comment                      = "User queries, Data team"
  provider                     = snowflake.sys
  query_acceleration_max_scale_factor = 0
}

resource "snowflake_warehouse_grant" "snowball_grant_usage" {
  warehouse_name = snowflake_warehouse.snowball.name
  privilege      = "USAGE"
  roles = [
    "DE_DEVS"
  ]
  with_grant_option = false
  provider          = snowflake.security
}