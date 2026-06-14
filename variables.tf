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


variable "subnet_tags" {
  type    = map(string)
  default = {}
}

variable "public_subnet_cidr"{
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}


variable "private_subnet_cidr"{
  type = list(string)
  default = ["10.0.11.0/24","10.0.12.0/24"]
}
