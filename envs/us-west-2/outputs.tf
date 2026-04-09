output "alb_dns_name" {
  value = module.alb.dns
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "asg_name" {
  value = module.compute.asg_name
}

output "dashboard_name" {
  value = "west-dashboard"
}