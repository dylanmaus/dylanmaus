variable "group" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
}

variable "domain_name" {
  description = "the root domain name"
  type        = string
}

variable "bucket_name" {
  description = "s3 bucket name"
  type        = string
}
