resource "aws_ecs_service" "flask_app" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    assign_public_ip = true
    security_groups = var.security_groups
  }

  depends_on = [var.iam_role_policy_attachment]
}

