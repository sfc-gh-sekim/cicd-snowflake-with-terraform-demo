# Create the sysadmin role
resource "snowflake_role" "de_devs" {
  name    = "de_devs"
  comment = "System administrator role"
}
