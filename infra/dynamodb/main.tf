provider "aws" {
  region = var.aws_region
}

module "dynamodb" {
  source       = "./modules"
  table_name   = "flask_users"
  billing_mode = "PAY_PER_REQUEST"
  username     = "id"
  email        = "email"
  password     = "password"
  tags = {
    Name        = "flask_users_table"
    Environment = "prod"
  }
}

