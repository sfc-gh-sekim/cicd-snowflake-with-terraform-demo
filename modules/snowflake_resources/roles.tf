# Create the sysadmin role
resource "snowflake_role" "de_devs" {
  name     = "DE_DEVS"
  comment  = "System administrator role"
}

resource "snowflake_role" "de_devs2" {
  name     = "DE_DEVS2"
  comment  = "System administrator role"
  provider = snowflake.security
}