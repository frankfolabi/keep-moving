resource "aws_dynamodb_table" "flask_users" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.username
range_key = var.email

  attribute {
    name = var.username
    type = var.attribute_type
  }

  attribute {
    name = var.email
    type = var.attribute_type
  }

global_secondary_index {
    name               = "EmailIndex"
    hash_key           = "email"
    projection_type    = "ALL"  
    read_capacity      = 5
    write_capacity     = 5
  }

  stream_enabled = var.stream_enabled

  tags = var.tags
}

