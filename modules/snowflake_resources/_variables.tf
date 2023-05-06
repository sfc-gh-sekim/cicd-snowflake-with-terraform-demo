variable "database" {
  type = string
}

variable "env_name" {
  type = string
}

variable "time_travel_in_days" {
  type        = number
  description = "Number of days for time travel feature"
}