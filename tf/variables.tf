variable "group" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "tags" {
  type = map(string)
}

variable "domain_name" {
  description = "the root domain name"
  type = string
}

variable "site_directory" {
  description = "path to static file"
  type = string
  default = "./static"
}
