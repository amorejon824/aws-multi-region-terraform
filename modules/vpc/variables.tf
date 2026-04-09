variable "vpc_cidr" {
  type = string
}

variable "env" {
  type = string
}

variable "azs" {
  type = list(string)
}