variable "family" {
  description = "The family of the ECS task definition"
  type        = string
}

variable "execution_role_arn" {
  description = "The ARN of the ECS task execution role"
  type        = string
}

variable "docker_image" {
  description = "The Docker image for the Flask app"
  type        = string
}

