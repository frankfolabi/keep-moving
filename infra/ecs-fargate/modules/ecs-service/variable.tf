variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "The ECS cluster ID"
  type        = string
}

variable "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "subnets" {
  description = "List of subnets for the ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups for the ECS service"
  type        = list(string)
}

variable "iam_role_policy_attachment" {
  description = "The IAM role policy attachment"
  type        = string
}

