variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "ami" {
  type = string
}

variable "env" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}