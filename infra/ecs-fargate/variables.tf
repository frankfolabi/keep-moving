variable "aws_region" {
  default = "us-east-1"
}

variable "docker_image" {
  description = "The Docker image URL for Flask app"
  type        = string
}

variable "cluster_name" {
  default = "get-inspired-quotes-cluster"
}

