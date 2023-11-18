# Create the sysadmin role
resource "snowflake_role" "sysadmin" {
  name    = "SYSADMIN"
  comment = "System administrator role"
}
