variable "name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_arn" {
  description = "The ARN of the ECS cluster"
  type        = string
}

variable "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "desired_count" {
  description = "Number of desired ECS tasks"
  type        = number
}

variable "target_group_arn" {
  description = "Target Group ARN for the ALB"
  type        = string
}

variable "container_name" {
  description = "Name of the container in the task definition"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}

variable "listener_arn" {
  description = "ARN of the ALB listener to be used with the ECS service"
  type        = string
}

