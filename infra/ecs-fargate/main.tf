provider "aws" {
  region = var.aws_region
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
  family = "get-inspired-quotes-task"
  execution_role_arn = module.iam_roles.ecs_task_execution_role_arn
  docker_image = var.docker_image
}

module "ecs_service" {
  source = "./modules/ecs-service"
  service_name = "get-inspired-quotes-service"
  cluster_id = module.ecs_cluster.id
  task_definition_arn = module.ecs_task_definition.task_definition_arn
  subnets = data.aws_subnets.default.ids
  security_groups = [module.security_group.id]
  iam_role_policy_attachment = module.iam_roles.ecs_task_execution_role_arn
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = data.aws_vpc.default.id
}

