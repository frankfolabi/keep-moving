output "dns_name" {
  value = aws_lb.flask.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.flask.arn
}

output "listener_arn" {
  value = aws_lb_listener.flask.arn
}

