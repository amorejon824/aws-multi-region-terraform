output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "target_group_suffix" {
  value = aws_lb_target_group.tg.arn_suffix
}

output "lb_suffix" {
  value = aws_lb.alb.arn_suffix
}

output "dns" {
  value = aws_lb.alb.dns_name
}