variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}