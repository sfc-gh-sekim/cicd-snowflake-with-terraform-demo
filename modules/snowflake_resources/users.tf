resource "snowflake_user" "nganage" {
  name                 = "NGANAGE"
  comment              = "Nikhil Ganage, Data Eng, Contractor"
  default_namespace    = ""
  default_role         = snowflake_role.sysadmin.name # Update this as needed
  disabled             = false
  display_name         = "nganage"
  email                = "nikhil.ganage@gmail.com"
  first_name           = "Nikhil"
  last_name            = "Ganage"
  login_name           = "NGANAGE"
  must_change_password = false
  password             = "A_strong_password_123!" # Set a secure password
  rsa_public_key       = null
  rsa_public_key_2     = null
}
