provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "azs" {}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.1.0.0/16"
  env      = "west"
  azs      = data.aws_availability_zones.azs.names
}

module "alb" {
  source  = "../../modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  env     = "west"
}

module "compute" {
  source           = "../../modules/compute"
  vpc_id           = module.vpc.vpc_id
  subnets          = module.vpc.public_subnets
  ami              = data.aws_ami.ami.id
  env              = "west"
  alb_sg_id        = module.alb.alb_sg_id
  target_group_arn = module.alb.target_group_arn
}
module "monitoring" {
  source = "../../modules/monitoring"

  env                 = "west"
  region              = "us-west-2"
  lb_suffix           = module.alb.lb_suffix
  target_group_suffix = module.alb.target_group_suffix
}