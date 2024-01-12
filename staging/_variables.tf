variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "env_name" {
  type    = string
  default = "STAGING"
}

variable "snowflake_private_key" {
  type        = string
  description = "Private key used to access Snowflake"
  default     = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCvBTujdOGs9/XR+Oxh/+0p6O7L6MB8K4MEVhqkifpcJovkkMinoSh3ypEACgl2gxVcldTnRMlmWWRKeulL2hitJWlyzVnC+QiKjaj1q67nUmP+6cPBhzy1Ue0UTcH01NP381cb0hTjGfVQrugFQ0Jjhob4Zu9JYwtINkzqs9jQSqEESShIw4ibEtz62pw942DlXDNyNdVK5wSCcIJj65GIrzq5fEUAhaa1VGUcyazZXjviRvMQ/WO2oIkb13ffaoZubqrgdOSyMdOsa3YeGkE1OockPkr8CWyB4oUw3D1g50zJDrS1KpPnl1OQzjY9EldzDRNKkOGuYTDVAX4ZdsKHAgMBAAECggEAPdN8aNaOLhr91Gm5nzjYH7jwOkoDTRnV039TNBKlxU28l0ZqC4VLlV2ScVAaXaoarrUjG3taJfSoEANxTGFD3E5d/Lb74Xs1gDRgnkBCreaV+mO7yi6qzGafeE+rl4BjTLDCccp5pGv0E8dloQ5McnoATdmW5/a78ot0Cmjzy0grgpbw3nVLj525zAPtdNLEk2u6E9GfEmka3KUlRLA3DLlKKMBLl46L0UQF0HjU2trEY7s4x3ri0lS8OWQSfZeQR6vGTAmbLg1g9uIc4NytLeWYGl8rRdrQ4j2kj6pjIXW6+so4c+WHHan9g4equ/b2kEqX2/D/OkGe2i2O0lO8UQKBgQDn7TqP08sa6qQ4iMEpvCL39Cygo/V6k3eAHkv7+nZzaT6dfcVmDUqxaDFibp1lh4u3IYvjBeEPHdllKzaaGg3IgPdIi0B+Lanx+1Vov36h7CZV5gGYt5aZ2SSFAdpJl8sDvHzmgPCGhvYyn6sih4fvV3x+hEdj4ae6TqvoawkXbwKBgQDBL+NPYd8pPf3QjutPDA+AkhXH9GSokDj6FR+Pn/1JajhlvpyrzFae62jLrFdeDAS1F5r6bbpo862fsqgwGaqoJvHC9VLAd0b+eO7/otFL5yzfmn1YKvhktd+CFnLgjsVYAS2CGkkJFbvGrp9Dv5tMFZSrvzCFXEdsHEj9ZOM6aQKBgQDDmo9+iEjPLcBNMgF/2n2/k/8jiMTbmY36zxKUtRu7oLK/jziyJlmtoEuuUc6Lt7L9Q9zAHtA+uJUGP1jwxTKEvUhRtagyAv9G6AuTqZX6qLl4TuFf1M6+eKXVS8e3s770Kr9IhMzXGPKBpapnF9ls4eNMrPGs6r9UYU+ZWNS1HwKBgQCIS53mmplUQo04wCxZt5uUTPya9tyxZBcesRp0PR741bz2Y3Wra13Nfy6PS4bULkx/6yiG+DVk6E6ddfFdBi61tcwpjOUWLtDipjWQG7HoCDBLjXZTZvWaMAqBgA8KSRAH18TgnmTayP+S3A43QQ5yrmMWjKvR2tn09zuzsqLxyQKBgHsjcy88Qt9RIzo2XusB3J7SiUHRKRTKltApv54LgCJFYlwl07GecWL1yIXMCcIsc77ezEWlJsHkyNvTYHtH9Kc7UREOcEFezUoNi1+2S7UtKq2RrYobCsEMXCaSrpHDPmSmws0auzLJ38HaijrtyC6FZ8gjiUkgWrwCMF1wRUP1"
  sensitive   = true
}