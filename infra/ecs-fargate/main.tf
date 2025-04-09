provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ecs_cluster" {
  source      = "./modules/ecs-cluster"
  cluster_name = var.cluster_name
}

module "iam_roles" {
  source = "./modules/iam-roles"
}

module "ecs_task_definition" {
  source = "./modules/ecs-task-definition"
  family = "flask-quotes-task"
  execution_role_arn = module.iam_roles.ecs_task_execution_role_arn
  docker_image = var.docker_image
}

module "ecs_service" {
  source              = "./modules/ecs-service"
  name                = "flask-quotes-service"
  cluster_arn         = module.ecs_cluster.arn
  task_definition_arn = module.ecs_task_definition.task_definition_arn
  subnet_ids          = data.aws_subnets.default.ids
  security_group_ids  = [module.security_group.ecs_sg_id]
  desired_count       = 1

  target_group_arn = module.alb.target_group_arn
  container_name   = "flask-quotes"
  container_port   = 5000

  listener_arn = module.alb.listener_arn
}


module "security_group" {
  source = "./modules/security-group"
  vpc_id = data.aws_vpc.default.id
}

module "alb" {
  source             = "./modules/alb"
  alb_name           = "flask-quotes-alb"
  vpc_id             = data.aws_vpc.default.id
  subnet_ids         = data.aws_subnets.default.ids
  security_group_ids = [module.security_group.lb_sg_id]
}

