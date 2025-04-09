output "ecs_sg_id" {
  description = "Security Group ID for ECS"
  value       = aws_security_group.flask_sg.id
}

output "lb_sg_id" {
  description = "Security Group ID for Load Balancer"
  value       = aws_security_group.flask_sg.id
}

