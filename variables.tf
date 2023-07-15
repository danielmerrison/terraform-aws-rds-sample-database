variable "name" {
  type        = string
  description = "The name to use when creating the database"
}

variable "dataset" {
  type        = string
  description = "The data set to use \"classicmodels\" or \"employees\".  Defaults to \"classicmodels\". more [info](https://github.com/danielmerrison/terraform-aws-sample-database)"

  default = "classicmodels"
}

variable "username" {
  type        = string
  description = "Username to use when creating the database. Defaults to 'dbuser'"
  default     = "dbuser"
}

variable "password" {
  type        = string
  description = "Password to use when creating the database (If not specified a random string will be used)"
  sensitive   = true
  default     = "<random_value>"
}
