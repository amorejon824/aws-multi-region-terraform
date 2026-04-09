output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "launch_template_id" {
  value = aws_launch_template.lt.id
}